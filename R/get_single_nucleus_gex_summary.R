#' Get Single Nucleus Gex Summary
#'
#' @description
#' Retrieve Summarized Single Nucleus Gene Expression Data.
#'
#'[GTEx Portal API
#'documentation](https://gtexportal.org/api/v2/redoc#tag/Expression-Data-Endpoints/operation/get_single_nucleus_gex_summary_api_v2_expression_singleNucleusGeneExpressionSummary_get)
#'
#'@inheritParams gtexr_arguments
#'
#' @return A Tibble
#' @export
#' @family Expression Data Endpoints
#'
#' @examples
#' \dontrun{
#' get_single_nucleus_gex_summary()
#' }
get_single_nucleus_gex_summary <- function(datasetId = "gtex_v8",
                                           tissueSiteDetailIds = NULL,
                                           page = 0,
                                           itemsPerPage = 250){
  gtex_query(endpoint = "expression/singleNucleusGeneExpressionSummary")
}
