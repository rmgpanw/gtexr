#' Get Linkage Disequilibrium By Variant Data
#'
#' @description Find linkage disequilibrium (LD) data for a given variant
#'
#' [GTEx Portal API
#' documentation](https://gtexportal.org/api/v2/redoc#tag/Datasets-Endpoints/operation/get_linkage_disequilibrium_by_variant_data_api_v2_dataset_ldByVariant_get)
#'
#' @inheritParams gtexr_arguments
#' @return A tibble.
#' @export
#' @family Datasets Endpoints
#'
#' @examples
#' get_linkage_disequilibrium_by_variant_data("chr1_159245536_C_T_b38")
get_linkage_disequilibrium_by_variant_data <- function(variantId,
                                                       page = 0,
                                                       itemsPerPage = 250) {
  resp_body <- gtex_query(endpoint = "dataset/ldByVariant", return_raw = TRUE)

  process_resp_body_linkage_disequilibrium(resp_body)
}
