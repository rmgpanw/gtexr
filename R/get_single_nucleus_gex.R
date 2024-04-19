#' Get Single Nucleux Gex
#'
#' @description
#' Retrieve Single Nucleus Gene Expression Data for a given Gene.
#'
#'[GTEx Portal API
#'documentation](https://gtexportal.org/api/v2/redoc#tag/Expression-Data-Endpoints/operation/get_single_nucleus_gex_api_v2_expression_singleNucleusGeneExpression_get)
#'
#'@inheritParams gtexr_arguments
#'
#' @return A Tibble
#' @export
#' @family Expression Data Endpoints
#'
#' @examples
#' \dontrun{
#' get_single_nucleus_gex(gencodeIds = "ENSG00000132693.12")
#' }
get_single_nucleus_gex <- function(gencodeIds,
                                   datasetId = "gtex_v8",
                                   tissueSiteDetailIds = NULL,
                                   excludeDataArray = TRUE,
                                   page = 0,
                                   itemsPerPage = 250){
  gtex_query(endpoint = "expression/singleNucleusGeneExpression")
}
