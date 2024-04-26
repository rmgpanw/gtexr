#'Get Annotations
#'
#'@description
#' - This service returns the list of annotations and allowed values by which a particular dataset can be subsetted.
#' - Results may be filtered by dataset.
#'
#'[GTEx Portal API
#'documentation](https://gtexportal.org/api/v2/redoc#tag/Datasets-Endpoints/operation/get_annotation_api_v2_dataset_annotation_get)
#'
#'@inheritParams gtexr_arguments
#'
#'@return A tibble
#'@export
#'@family Datasets Endpoints
#'
#' @examples
#' get_annotation()
get_annotation <- function(datasetId = "gtex_v8",
                           page = 0,
                           itemsPerPage = 250){
  gtex_query(endpoint = "dataset/annotation")
}
