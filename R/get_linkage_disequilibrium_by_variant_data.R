#' Get Linkage Disequilibrium By Variant Data
#'
#' @description
#' - Find linkage disequilibrium (LD) data for a given variant
#'
#'[GTEx Portal API documentation]
#'https://gtexportal.org/api/v2/redoc#tag/Datasets-Endpoints/operation/get_linkage_disequilibrium_by_variant_data_api_v2_dataset_ldByVariant_get
#'
#'@inheritParams gtexr_arguments
#'@return A Tibble
#'@export
#'@family Dataset Endpoints
#'
#' @examples
#' \dontrun
#' get_linkage_disequilibrium_by_variant_data()
get_linkage_disequilibirum_by_variant_data <- function(variantId = NULL,
                                                      page = 0,
                                                      itemsPerPage = 250){
  gtex_query(endpoint = "dataset/ldByVariant")
}
