#' Get File List
#'
#' @description
#' - Get all the files in GTEx dataset for Download page
#'
#' [GTEx Portal API
#' documentation](https://gtexportal.org/api/v2/redoc#tag/Datasets-Endpoints/operation/get_file_list_api_v2_dataset_fileList_get)
#'
#'
#' @return A Tibble
#' @export
#' @family Datasets Endpoints
#'
#' @examples
#' get_file_list()
get_file_list <- function() {
  gtex_query(endpoint = "dataset/fileList",
             return_raw = TRUE) |>
    purrr::map(tibble::as_tibble) |>
    dplyr::bind_rows()
}
