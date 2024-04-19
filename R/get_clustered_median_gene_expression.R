#' Get Clustered Median Gene Expression
#'
#' @description
#' - Find median gene expression data along with hierarchical clusters .
#' - Returns median gene expression in tissues along with The hierarchical clustering results of tissues and genes, based on gene expression, in Newick format.
#' - Results may be filtered by dataset, gene or tissue, but at least one gene must be provided
#' - The hierarchical clustering is performed by calculating Euclidean distances and using the average linkage method.
#' - This endpoint is not paginated.
#' - By default, this service queries the latest GTEx release.
#'
#' [GTEx Portal API
#'documentation](https://gtexportal.org/api/v2/redoc#tag/Expression-Data-Endpoints/operation/get_clustered_median_gene_expression_api_v2_expression_clusteredMedianGeneExpression_get)
#'
#'@inheritParams gtexr_arguments
#'
#' @return A Tibble
#' @export
#' @family Expression Data Endpoints
#'
#' @examples
#' \dontrun{
#' get_clustered_median_gene_expression(gencodeIds = "ENSG00000132693.12")
#' }
get_clustered_median_gene_expression <- function(gencodeIds,
                                                 datasetId = "gtex_v8",
                                                 tissueSiteDetailIds = NULL){
  gtex_query(endpoint = "expression/clusteredMedianGeneExpression")
}