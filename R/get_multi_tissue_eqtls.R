#' Get Significant Single Tissue Eqtls By Location
#'
#' @description Find significant single tissue eQTLs using Chromosomal Locations.
#' This service returns precomputed significant single tissue eQTLs.
#' Results may be filtered by tissue, and/or dataset.
#' By default, the service queries the latest GTEx release. Since this endpoint is used to support a third party program on the portal, the return structure is different from other endpoints and is not paginated.
#'
#' [GTEx Portal API
#' documentation](https://gtexportal.org/api/v2/redoc#tag/Static-Association-Endpoints/operation/get_significant_single_tissue_eqtls_api_v2_association_singleTissueEqtl_get)
#'
#' @inheritParams gtexr_arguments
#'
#' @return A tibble.
#' @export
#' @family Static Association Endpoints
#'
#' @examples
#' \dontrun{
#' # search by gene
#' get_multi_tissue_eqtls(gencodeIds = c("ENSG00000132693.12",
#'                                "ENSG00000203782.5"))}
get_multi_tissue_eqtls <- function(gencodeId,
                                   variantId = NULL,
                                   datasetId = "gtex_v8",
                                   page = 0,
                                   itemsPerPage = 250){
  gtex_query(endpoint = "association/metasoft")
}
