library(shiny)
library(gtexr)
library(purrr)

ui <- fluidPage(
  textInput("geneIds", "geneIds", "CRP"),
  selectInput("gencodeVersion", "gencodeVersion", choices = c("v26", "v19")),
  selectInput("genomeBuild", "genomeBuild", choices = c("GRCh38/hg38", "GRCh37/hg19")),
  numericInput("page", "page", min = 0, max = 100000, value = 0),
  numericInput("itemsPerPage", "itemsPerPage", min = 1, max = 100000, value = 250),
  actionButton("send_request", "Send request"),
  tableOutput("result")
)

server <- function(input, output, session) {

  response <-
    eventReactive(
      input$send_request,
      ignoreInit = TRUE,
      valueExpr = get_genes(
        geneIds = input$geneIds,
        gencodeVersion = input$gencodeVersion,
        genomeBuild = input$genomeBuild,
        page = input$page,
        itemsPerPage = input$itemsPerPage
      )
    )

  output$result <-
    renderTable(response())
}

shinyApp(ui, server)
