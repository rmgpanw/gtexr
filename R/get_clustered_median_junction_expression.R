#' Get Clustered Median Junction Expression
#'
#' @description
#' - Find median junction expression data along with hierarchical clusters .
#' - Returns median junction read counts in tissues of a given gene from all known transcripts along with the hierarchical clustering results of tissues and genes, based on junction expression, in Newick format.
#' - Results may be filtered by dataset, gene or tissue, but at least one gene must be provided.
#' - The hierarchical clustering is performed by calculating Euclidean distances and using the average linkage method.
#' - **This endpoint is not paginated.**
#' - By default, this service queries the latest GTEx release.
#'
#' [GTEx Portal API
#'documentation](https://gtexportal.org/api/v2/redoc#tag/Expression-Data-Endpoints/operation/get_clustered_median_junction_expression_api_v2_expression_clusteredMedianJunctionExpression_get)
#'
#'@inheritParams gtexr_arguments
#'
#' @return A list with items "clusters" (a list) and "medianJunctionExpression"
#'  (a tibble).
#' @export
#' @family Expression Data Endpoints
#'
#' @examples
#' \dontrun{
#' get_clustered_median_junction_expression(gencodeIds = "ENSG00000132693.12")
#' }
get_clustered_median_junction_expression <- function(gencodeIds,
                                                     datasetId = "gtex_v8",
                                                     tissueSiteDetailIds = NULL){
  response <- gtex_query(endpoint = "expression/clusteredMedianJunctionExpression",
             return_raw = TRUE)

  response$medianJunctionExpression <-
    response$medianJunctionExpression |>
    purrr::map(tibble::as_tibble) |>
    dplyr::bind_rows()

  return(response)
}
