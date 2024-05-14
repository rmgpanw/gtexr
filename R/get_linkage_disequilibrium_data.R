#' Get Linkage Disequilibrium Data
#'
#' @description
#' - Find linkage disequilibrium (LD) data for a given gene.
#' - This endpoint returns linkage disequilibrium data for the cis-eQTLs found associated with the provided gene in a specified dataset.
#' - Results are queried by gencode ID. By default, the service queries the latest GTEx release.
#' - Specify a dataset ID to fetch results from a different dataset.
#'
#' [GTEx Portal API documentation](https://gtexportal.org/api/v2/redoc#tag/Datasets-Endpoints/operation/get_variant_by_location_api_v2_dataset_variantByLocation_get)
#'
#' @inheritParams gtexr_arguments
#' @return A tibble.
#' @export
#'@family Datasets Endpoints
#'
#' @examples
#' get_linkage_disequilibrium_data(gencodeIds = c("ENSG00000132693.12",
#'                                                   "ENSG00000203782.5"))
get_linkage_disequilibrium_data <- function(gencodeIds,
                                            datasetId = "gtex_v8",
                                            page = 0,
                                            itemsPerPage = 250){
  gtex_query(endpoint = "dataset/ld",
             return_raw = TRUE)$data |>
    purrr::map(\(x) tibble::tibble(variants = x[[1]], ld = x[[2]])) |>
    dplyr::bind_rows() |>
    tidyr::separate_wider_delim(
      cols = "variants",
      delim = ",",
      names = c("variantId_1", "variantId_2")
    )
}