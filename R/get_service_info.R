#' Get Service Info
#'
#' General information about the GTEx service.
#'
#' @return A tibble.
#' @export
#'
#' @examples
#' get_service_info()
get_service_info <- function() {
  gtex_query(endpoint = NULL)
}
