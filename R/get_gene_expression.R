#' Get Gene Expression
#'
#' @description
#' - Find normalized gene expression data.
#' - Returns normalized gene expression in tissues at the sample level.
#' - Results may be filtered by dataset, gene or tissue, but at least one gene must be provided.
#' - By default, this service queries the latest GTEx release.
#'
#'[GTEx Portal API
#'documentation](https://gtexportal.org/api/v2/redoc#tag/Expression-Data-Endpoints/operation/get_gene_expression_api_v2_expression_geneExpression_get)
#'
#' @inheritParams gtexr_arguments
#'
#' @return A Tibble
#' @export
#' @family Expression Data Endpoints
#'
#' @examples
#' \dontrun{
#' get_gene_expression(gencodeIds = "ENSG00000132693.12")
#' }
get_gene_expression <- function(gencodeIds,
                                datasetId = "gtex_v8",
                                tissueSiteDetailId = NULL,
                                attributeSubset = NULL,
                                page = 0,
                                itemsPerPage = 250){
  gtex_query(endpoint = "expression/geneExpression")
}
