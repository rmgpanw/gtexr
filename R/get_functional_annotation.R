#'Get Functional Annotation
#'
#'@description
#' - This endpoint retrieves the functional annotation of a certain chromosome location. Default to most recent dataset release.
#'
#'[GTEx Portal API documentation]
#'https://gtexportal.org/api/v2/redoc#tag/Datasets-Endpoints/operation/get_full_get_collapsed_gene_model_exon_api_v2_dataset_fullCollapsedGeneModelExon_get
#'
#'@inheritParams gtexr_arguments
#'@return A Tibble
#'@export
#'@family Dataset Endpoints
#'
#' @examples
#' \dontrun
#' get_functional_annotation(chromosome = "chr15", start = 1400, end = 20000)
get_functional_annotation <- function(datasetId = "gtex_v8",
                                      chromosome,
                                      start,
                                      end,
                                      page = 0,
                                      itemsPerPage = 250){
  gtex_query(endpoint = "dataset/functionalAnnotation")
}
