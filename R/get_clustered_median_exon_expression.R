#' Get Clustered Median Exon Expression
#'
#' @description
#' Find median transcript expression data along with hierarchical clusters.
#'
#' - Returns median normalized transcript expression in tissues of all known transcripts of a given gene along with the hierarchical clustering results of tissues and transcripts, based on exon expression, in Newick format.
#' - The hierarchical clustering is performed by calculating Euclidean distances and using the average linkage method.
#' - **This endpoint is not paginated.**
#' - By default, this endpoint queries the latest GTEx release.
#'
#' [GTEx Portal API
#'documentation](https://gtexportal.org/api/v2/redoc#tag/Expression-Data-Endpoints/operation/get_clustered_median_exon_expression_api_v2_expression_clusteredMedianExonExpression_get)
#'
#'@inheritParams gtexr_arguments
#'
#' @return A list with items "clusters" (a list) and "medianExonExpression"
#'  (a tibble).
#' @export
#' @family Expression Data Endpoints
#'
#' @examples
#' \dontrun{
#' get_clustered_median_exon_expression(tissueSiteDetailIds = "Artery_Aorta")
#' }
get_clustered_median_exon_expression <- function(gencodeIds,
                                                 datasetId = "gtex_v8",
                                                 tissueSiteDetailIds = NULL){
  response <- gtex_query(endpoint = "expression/clusteredMedianExonExpression",
             return_raw = TRUE)

  response$medianExonExpression <-
    response$medianExonExpression |>
    purrr::map(tibble::as_tibble) |>
    dplyr::bind_rows()

  return(response)
}
