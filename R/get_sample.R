#' Get Sample
#'
#' @description
#' - This service returns information of samples used in analyses from all datasets.
#' - Results may be filtered by dataset ID, sample ID, subject ID, sample metadata, or other provided parameters.
#' - By default, this service queries the latest GTEx release.
#'
#' [GTEx Portal API documentation]
#' https://gtexportal.org/api/v2/redoc#tag/Datasets-Endpoints/operation/get_sample_api_v2_dataset_sample_get
#'
#'@inheritParams gtexr_arguments
#'@return A Tibble
#'@export
#'@family Dataset Endpoints
#'
#' @examples
#' \dontrun
#' get_saumple()
get_sample <- function(datasetId = "gtex_v8",
                       sampleId = NULL,
                       tissueSampleIds = NULL,
                       subjectId = NULL,
                       ageBracket = NULL,
                       sex = NULL,
                       pathCategory = NULL,
                       tissueSiteDetailId = NULL,
                       aliquotId = NULL,
                       autolysisScore = NULL,
                       hardyScale = NULL,
                       ischemicTime = NULL,
                       ischemicTimeGroup = NULL,
                       rin = NULL,
                       uberonId = NULL,
                       dataType = NULL,
                       sortBy = NULL,
                       sortDirection = NULL,
                       page = NULL,
                       itemsPerPage = NULL){
  gtex_query(endpoint = "dataset/sample")
}
