#' Get Median Gene Expression
#'
#' @description
#'
#' Find median gene expression data along with hierarchical clusters.
#'
#' - Returns median gene expression in tissues.
#' - By default, this endpoint queries the latest GTEx release.
#'
#' [GTEx Portal API
#' documentation](https://gtexportal.org/api/v2/redoc#tag/Expression-Data-Endpoints/operation/get_median_gene_expression_api_v2_expression_medianGeneExpression_get)
#'
#' @inheritParams gtexr_arguments
#'
#' @return A tibble.
#' @export
#' @family Expression Data Endpoints
#'
#' @examples
#' \dontrun{
#' get_median_gene_expression(gencodeIds = "ENSG00000132693.12")
#' }
get_median_gene_expression <- function(gencodeIds,
                                       datasetId = "gtex_v8",
                                       tissueSiteDetailIds = NULL,
                                       page = 0,
                                       itemsPerPage = 250){
  gtex_query(endpoint = "expression/medianGeneExpression")
}
