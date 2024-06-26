#' Get Full Get Collapsed Gene Model Exon
#'
#' @description This service allows the user to query the full Collapsed Gene
#' Model Exon of a specific gene by gencode ID
#'
#' [GTEx Portal API
#' documentation](https://gtexportal.org/api/v2/redoc#tag/Datasets-Endpoints/operation/get_full_get_collapsed_gene_model_exon_api_v2_dataset_fullCollapsedGeneModelExon_get)
#'
#' @inheritParams gtexr_arguments
#'
#' @return A tibble
#' @export
#' @family Datasets Endpoints
#'
#' @examples
#' \dontrun{
#'   get_full_get_collapsed_gene_model_exon(gencodeId = "ENSG00000203782.5")
#' }
get_full_get_collapsed_gene_model_exon <- function(gencodeId,
                                                   page = 0,
                                                   itemsPerPage = 250){
  gtex_query(endpoint = "dataset/fullCollapsedGeneModelExon")
}
