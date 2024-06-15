#' Get File List
#'
#' @description
#' Get all the files in GTEx dataset for Download page
#'
#' [GTEx Portal API
#' documentation](https://gtexportal.org/api/v2/redoc#tag/Datasets-Endpoints/operation/get_file_list_api_v2_dataset_fileList_get)
#'
#' @return A tibble
#' @export
#' @family Datasets Endpoints
#'
#' @examples
#' get_file_list()
get_file_list <- function() {
  result <- gtex_query(endpoint = "dataset/fileList", return_raw = TRUE)
  result |>
    purrr::map(\(x) x |>
                 purrr::map_at("filesets", list) |>
                 tibble::as_tibble(),
               .progress = TRUE) |>
    dplyr::bind_rows() |>
    # add names to lists ('filesets' and 'files')
    dplyr::mutate("filesets" = purrr::map(.data[["filesets"]], \(x) {
      names(x) <- purrr::map_chr(x, \(y) y$name)
      x <- x |>
        purrr::map(\(x) x |>
                     purrr::map_at("files", \(y) {
                       names(y) <- purrr::map_chr(y, \(z) z$name)
                       y
                     }))
      x
    }))
}
