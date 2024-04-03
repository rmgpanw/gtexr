#' Get Service Info
#'
#' General information about the GTEx service.
#'
#' @return A tibble.
#' @export
#' @family GTEx Portal API Info
#'
#' @examples
#' get_service_info()
get_service_info <- function() {
  gtex_query(endpoint = NULL, return_raw = TRUE) |>
    purrr::map_at("organization", tibble::as_tibble) |>
    tibble::as_tibble() |>
    tidyr::unnest(cols = "organization", names_sep = "_")
}
