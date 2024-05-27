#' Get Service Info
#'
#' @description General information about the GTEx service.
#'
#' [GTEx Portal API
#' documentation](https://gtexportal.org/api/v2/redoc#tag/GTEx-Portal-API-Info/operation/get_service_info_api_v2__get).
#'
#' @return A tibble.
#' @export
#' @family GTEx Portal API Info
#'
#' @examples
#' \dontrun{
#' get_service_info()
#' }
get_service_info <- function() {
  gtex_query(endpoint = NULL, return_raw = TRUE) |>
    purrr::map_at("organization", tibble::as_tibble) |>
    tibble::as_tibble() |>
    tidyr::unnest(cols = "organization", names_sep = "_")
}
