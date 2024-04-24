#'Get Downloads Page Data
#'
#'@description
#' - Retrieves all the files belonging to the given project_id for display on the Downloads Page
#'
#'[GTEx Portal API
#'documentation](https://gtexportal.org/api/v2/redoc#tag/Datasets-Endpoints/operation/get_downloads_page_data_api_v2_dataset_openAccessFilesMetadata_get)
#'
#'@inheritParams gtexr_arguments
#'
#'@return A Tibble
#'@export
#'@family Datasets Endpoints
#'
#' @examples
#' get_downloads_page_data()
get_downloads_page_data <- function(project_id = "adult-gtex") {
  gtex_query(endpoint = "dataset/openAccessFilesMetadata",
             return_raw = TRUE)$data |>
    purrr::map(tibble::as_tibble) |>
    dplyr::bind_rows()
}
