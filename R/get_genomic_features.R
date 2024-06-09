#' Get Genomic Features
#'
#' @description [GTEx API Portal
#' docs](https://gtexportal.org/api/v2/redoc#tag/Reference-Genome-Endpoints/operation/get_genomic_features_api_v2_reference_features__featureId__get)
#'
#' @details This endpoint takes a path parameter "featureId".
#'
#' @inheritParams gtexr_arguments
#'
#' @return A tibble
#' @export
#' @family Reference Genome Endpoints
#'
#' @examples
#' \dontrun{
#' # gene symbol
#' get_genomic_features("brca1")
#'
#' # GENCODE ID
#' get_genomic_features("ENSG00000132693.12")
#'
#' # RSID
#' get_genomic_features("rs1815739")
#'
#' # GTEx variant ID
#' get_genomic_features("chr11_66561023_G_GTTA_b38")
#' }
get_genomic_features <- function(.featureId,
                                 datasetId = "gtex_v8") {
  if (!rlang::is_string(.featureId)) {
    cli::cli_abort("`.featureId` must be a single string.")
  }

  result <- gtex_query(endpoint = paste0("reference/features/", .featureId),
                       return_raw = TRUE)

  tibble::as_tibble(result$features[[1]]) |>
    dplyr::mutate("assembly" = result$assembly)
}
