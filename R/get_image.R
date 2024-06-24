#' Get Image
#'
#' @description [GTEx Portal API
#' documentation](https://gtexportal.org/api/v2/redoc#tag/Histology-Endpoints/operation/get_image_api_v2_histology_image_get)
#'
#' @inheritParams gtexr_arguments
#'
#' @return A tibble.
#' @export
#' @family Histology Endpoints
#'
#' @examples
#' \dontrun{
#' get_image()
#'
#' # filter by `tissueSampleId`
#' get_image(tissueSampleIds = "GTEX-1117F-0226", page = 0, itemsPerPage = 100000)
#' }
get_image <- function(tissueSampleIds = NULL,
                      page = 0,
                      itemsPerPage = 250) {
  gtex_query(endpoint = "histology/image") |>
    tidyr::unnest(cols = "pathologyNotesCategories", keep_empty = TRUE)
}
