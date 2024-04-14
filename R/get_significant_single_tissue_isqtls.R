#' Get Significant Single Tissue Isqtls
#'
#' Retrieve Interaction sQTL Data. This service retrieves cell type interaction
#' sQTLs (isQTLs), from a specified dataset. Results may be filtered by tissue
#' By default, the service queries the latest GTEx release. The retrieved data
#' is split into pages with items_per_page entries per page
#'
#' [GTEx Portal API
#' documentation](https://gtexportal.org/api/v2/redoc#tag/Static-Association-Endpoints/operation/get_significant_single_tissue_isqtls_api_v2_association_singleTissueISqtl_get)
#'
#' @inheritParams gtexr_arguments
#' @return A Tibble
#' @export
#' @family Static Assocation Endpoints
#'
#' @examples
#' \dontrun{
#' get_significant_single_tissue_isqtls(gencodeId = "ENSG00000132693.12")
#' }
get_significant_single_tissue_isqtls <- function(gencodeId,
                                                 variantId = NULL,
                                                 tissueSiteDetailId = NULL,
                                                 datasetId = "gtex_v8",
                                                 page = 0,
                                                 itemsPerPage = 250){
  gtex_query(endpoint = "association/singleTissueISqtl")
}
