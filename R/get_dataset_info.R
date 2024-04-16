#' Get Dataset Info
#'
#' NB This current returns empty values.
#'
#' @inheritParams gtexr_arguments
#'
#' @return A tibble.
#' @export
#' @family Metadata Endpoints
#'
#' @examples
#' get_dataset_info()
get_dataset_info <- function(datasetId = "gtex_v8",
                      organizationName = "GTEx Consortium") {
  gtex_query(endpoint = "metadata/dataset")
}
