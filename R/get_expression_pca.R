#' Get Expression Pca
#'
#' @description
#' - Find gene expression PCA data.
#' - Returns gene expression PCA (principal component analysis) in tissues.
#' - Results may be filtered by tissue, sample, or dataset.
#' - By default, the service queries the latest GTEx release.
#'
#'[GTEx Portal API
#'documentation](https://gtexportal.org/api/v2/redoc#tag/Expression-Data-Endpoints/operation/get_expression_pca_api_v2_expression_expressionPca_get)
#'
#' @inheritParams gtexr_arguments
#'
#' @return A Tibble
#' @export
#' @family Expression Data Endpoints
#'
#' @examples
#' \dontrun{
#' get_expression_pca(tissueSiteDetailIds = "Artery_Aorta")
#' }
get_expression_pca <- function(tissueSiteDetailIds,
                               datasetId = "gtex_v8",
                               sampleId = "^GTEX-[A-Z0-9]{5}-[0-9]{4}-SM-[A-Z0-9]{5}$", #ASK ALASDAIR
                               page = 0,
                               itemsPerPage = 250){
  gtex_query(endpoint = "expression/expressionPca")
}
