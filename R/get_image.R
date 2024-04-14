#' Get Image
#'
#' @inheritParams gtexr_arguments
#'
#' @return A tibble.
#' @export
#' @family Histology Endpoints
#'
#' @examples
#' get_image()
#' get_image(tissueSampleId = "GTEX-1117F-0226", page = 0, itemsPerPage = 100000)
get_image <- function(tissueSampleId = NULL,
                      page = 0,
                      itemsPerPage = 250) {
  gtex_query(endpoint = "histology/image")
}
