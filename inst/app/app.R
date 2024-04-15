library(shiny)
library(gtexr)
library(purrr)
library(stringr)

metadata <- gtexr:::gtexr_arguments()

# Utils -------------------------------------------------------------------

get_gtexr_fn_args <- function(gtexr_fn) {
  gtexr_fn_args <- gtexr_fn |>
    rlang::sym() |>
    eval() |>
    rlang::fn_fmls()
}

# UI ----------------------------------------------------------------------

endpointUI <- function(id, gtexr_fn, metadata) {
  ns <- NS(id)

  gtexr_fn_args <- get_gtexr_fn_args(gtexr_fn)

  # create a list of UI inputs - one input for each function argument
  query_params <- gtexr_fn_args |>
    purrr::imap(\(value, arg) {
      arg_metadata <- metadata[metadata$arg == arg, ]

      switch(arg_metadata$shinyinput,
             "textInput" = rlang::call2("textInput", inputId = rlang::call2("ns", arg), label = arg, value = value),
             "textAreaInput" = rlang::call2("textAreaInput", inputId = rlang::call2("ns", arg), label = arg, value = value),
             "selectInput" = rlang::call2("selectInput", inputId = rlang::call2("ns", arg), label = arg, choices = arg_metadata$choices[[1]], selected = value),
             "selectizeInput" = rlang::call2("selectizeInput", inputId = rlang::call2("ns", arg), label = arg, choices = arg_metadata$choices[[1]], selected = value, multiple = TRUE),
             "numericInput" = rlang::call2("numericInput", inputId = rlang::call2("ns", arg), label = arg, min = arg_metadata$choices[[1]][1], max = arg_metadata$choices[[1]][2], value = value),
             ... = cli::cli_abort(c("Unrecognised `shinyinput` value for {.fn {gtexr_fn}} arg `{arg}`: '{arg_metadata$shinyinput}'",
                                    "i" = "Check `gtexr_arguments()`")))
    }) |>
    purrr::map(rlang::eval_tidy, env = rlang::caller_env(n = 0))

  # multiple text input params - these inputs need converting to character vectors
  multiple_text_inputs <- metadata |>
    dplyr::filter(.data[["arg"]] %in% !!names(gtexr_fn_args)) |>
    dplyr::filter(.data[["shinyinput"]] == "textAreaInput")

  # Important - UI fails to render if this is a named list
  names(query_params) <- NULL

  # UI
  tagList(
    !!!query_params,
    actionButton(ns("send_request"), "Send request"),
    verbatimTextOutput(ns("query_code")),
    tableOutput(ns("result"))
  )
}

# Server ------------------------------------------------------------------

endpointServer <- function(id, gtexr_fn) {

  gtexr_fn_args <- get_gtexr_fn_args(gtexr_fn)

  moduleServer(id, function(input, output, session) {

    # generate code with user-specified argument values
    query <- eventReactive(
      input$send_request,
      ignoreInit = TRUE,
      valueExpr = {
        # extract query params from user input
        query_params_input <- reactiveValuesToList(input)[names(gtexr_fn_args)]

        # split any multiple text entries into character vectors
        query_params_input <- query_params_input |>
          purrr::map_at(.at = multiple_text_inputs$arg,
                        \(x) x |>
                          stringr::str_split_1("\n") |>
                          stringr::str_trim())

        # create call
        rlang::call2(gtexr_fn, !!!query_params_input)
      })

    # display generated code
    output$query_code <- renderPrint(query())

    # evaluate code, catching any error messages
    response <-
      reactive(tryCatch(
        eval(query()),
        error = function(cnd)
          cnd
      ))

    output$result <-
      renderTable({
        if (inherits(response(), "error")) {
          validate(c(response()$message, response()$body))
        }
        response()
      })
  })
}

# App ---------------------------------------------------------------------

gtexr_functions <- c("get_eqtl_genes",
                     "get_genes",
                     "get_news_item")

# create UI tabPanels programmatically

tab_panels <- gtexr_functions |>
  purrr::map(\(fn) tabPanel(fn,
                            endpointUI(
                              fn,
                              gtexr_fn = fn,
                              metadata = metadata
                            )))

ui <- fluidPage(
  tabsetPanel(!!!tab_panels)
)

# construct server function programmatically

server_body <- gtexr_functions |>
  purrr::map(\(fn) rlang::call2("endpointServer", id = fn, gtexr_fn = fn))

server_body <- rlang::call2("{", !!!server_body)

server <- rlang::new_function(rlang::pairlist2(input = , output = , session =),
                               body = server_body)

shinyApp(ui, server)
