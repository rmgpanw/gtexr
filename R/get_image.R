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
#' result <- get_image(tissueSampleIds = "GTEX-1117F-0526")
#' print(result)
#'
#' # note that `pathologyNotesCategories` (if present) is a list column
#' print(result$pathologyNotesCategories)
#' }
get_image <- function(tissueSampleIds = NULL,
                      page = 0,
                      itemsPerPage = 250) {
  resp_body <- gtex_query(endpoint = "histology/image", return_raw = TRUE)

  paging_info_messages(resp_body)

  resp_body$data |>
    purrr::map(\(x) {
      if (!rlang::is_empty(x$pathologyNotesCategories)) {
        x$pathologyNotesCategories <- tibble::as_tibble(x$pathologyNotesCategories)
      }

      x |>
        purrr::compact() |>
        tibble::as_tibble()
    }, .progress = TRUE) |>
    dplyr::bind_rows()
}
