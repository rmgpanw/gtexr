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
#' get_image(tissueSampleIds = "GTEX-1117F-0226", page = 0, itemsPerPage = 100000)
get_image <- function(tissueSampleIds = NULL,
                      page = 0,
                      itemsPerPage = 250) {
  gtex_query(endpoint = "histology/image") |>
    tidyr::unnest(cols = "pathologyNotesCategories", keep_empty = TRUE)
}
