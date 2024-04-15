library(shiny)
library(gtexr)
library(purrr)
library(stringr)

metadata <- gtexr_arguments()

# create a list of UI inputs - one input for each function argument
gtexr_fn <- "get_genes"

gtexr_fn_args <- gtexr_fn |>
  rlang::sym() |>
  eval() |>
  rlang::fn_fmls()

query_params <- gtexr_fn_args |>
  purrr::imap(\(value, arg) {
    arg_metadata <- metadata[metadata$arg == arg, ]

    switch(arg_metadata$shinyinput,
           "textInput" = rlang::call2("textInput", inputId = arg, label = arg, value = value),
           "textAreaInput" = rlang::call2("textAreaInput", inputId = arg, label = arg, value = value),
           "selectInput" = rlang::call2("selectInput", inputId = arg, label = arg, choices = arg_metadata$choices[[1]], selected = value),
           "selectizeInput" = rlang::call2("selectizeInput", inputId = arg, label = arg, choices = arg_metadata$choices[[1]], selected = value, multiple = TRUE),
           "numericInput" = rlang::call2("numericInput", inputId = arg, label = arg, min = arg_metadata$choices[[1]][1], max = arg_metadata$choices[[1]][2], value = value),
           ... = cli::cli_abort(c("Unrecognised `shinyinput` value for {.fn {gtexr_fn}} arg `{arg}`: '{arg_metadata$shinyinput}'",
                                  "i" = "Check `gtexr_arguments()`")))
  }) |>
  purrr::map(eval)

# multiple text input params - these inputs need converting to character vectors
multiple_text_inputs <- metadata |>
  dplyr::filter(.data[["arg"]] %in% !!names(gtexr_fn_args)) |>
  dplyr::filter(.data[["shinyinput"]] == "textAreaInput")

# Important - UI fails to render if this is a named list
names(query_params) <- NULL

# UI
ui <- fluidPage(
  !!!query_params,
  actionButton("send_request", "Send request"),
  verbatimTextOutput("query_code"),
  tableOutput("result")
)

server <- function(input, output, session) {

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
}

shinyApp(ui, server)
