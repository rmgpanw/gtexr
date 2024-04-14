library(shiny)
library(gtexr)
library(purrr)


params <- list(
  rlang::call2("textInput", inputId = "geneIds", label = "geneIds", value = "CRP"),
  rlang::call2("selectInput", inputId = "gencodeVersion", label = "gencodeVersion", choices = c("v26", "v19"))
) %>%
  purrr::map(eval)

ui <- fluidPage(
  # eval(rlang::call2("textInput", inputId = "geneIds", label = "geneIds", value = "CRP")),
  # # textInput("geneIds", "geneIds", "CRP"),
  # eval(rlang::call2("selectInput", inputId = "gencodeVersion", label = "gencodeVersion", choices = c("v26", "v19"))),
  # # selectInput("gencodeVersion", "gencodeVersion", choices = c("v26", "v19")),
  !!!params,
  selectInput("genomeBuild", "genomeBuild", choices = c("GRCh38/hg38", "GRCh37/hg19")),
  numericInput("page", "page", min = 0, max = 100000, value = 0),
  numericInput("itemsPerPage", "itemsPerPage", min = 1, max = 100000, value = 250),
  actionButton("send_request", "Send request"),
  verbatimTextOutput("query_code"),
  tableOutput("result")
)

server <- function(input, output, session) {

  query <- eventReactive(
    input$send_request,
    ignoreInit = TRUE,
    valueExpr = rlang::expr(get_genes(
    geneIds = !!input$geneIds,
    gencodeVersion = !!input$gencodeVersion,
    genomeBuild = !!input$genomeBuild,
    page = !!input$page,
    itemsPerPage = !!input$itemsPerPage
  )))

  output$query_code <- renderPrint(query())

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
