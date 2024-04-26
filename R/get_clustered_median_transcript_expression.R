#'Get Clustered Median Transcript Expression
#'
#'@description
#' - Find median transcript expression data of all known transcripts of a gene along with hierarchical clusters .
#' - Returns median normalized expression in tissues of all known transcripts of a given gene along with the hierarchical clustering results of tissues and genes, based on expression, in Newick format.
#' - Results may be filtered by dataset, gene or tissue, but at least one gene must be provided.
#' - The hierarchical clustering is performed by calculating Euclidean distances and using the average linkage method.
#' - **This endpoint is not paginated.**
#' - By default, this service queries the latest GTEx release.
#'
#'[GTEx Portal API
#'documentation](https://gtexportal.org/api/v2/redoc#tag/Expression-Data-Endpoints/operation/get_median_transcript_expression_api_v2_expression_medianTranscriptExpression_get)
#'
#'@inheritParams gtexr_arguments
#'
#' @return A tibble, with clustering data stored as an attribute, "clusters".
#'@export
#'@family Expression Data Endpoints
#'
#' @examples
#' \dontrun{
#' get_clustered_median_transcript_expression(gencodeIds = c("ENSG00000203782.5",
#'                                                           "ENSG00000132693.12"))
#'
#' # clustering data is stored as an attribute "clusters"
#' attributes(result)$cluster
#' }
get_clustered_median_transcript_expression <- function(gencodeIds,
                                                       datasetId = "gtex_v8",
                                                       tissueSiteDetailIds = NULL){
  response <- gtex_query(endpoint = "expression/clusteredMedianTranscriptExpression",
             return_raw = TRUE)

  result <-
    response$medianTranscriptExpression |>
    purrr::map(tibble::as_tibble) |>
    dplyr::bind_rows()

  attr(result, "clusters") <- response$clusters

  cli::cli_alert_info("Retrieve clustering data with `attrbutes(<df>)$clusters`")

  return(result)
}
