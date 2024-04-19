#'Get Tissue Site Detail
#'
#'@description
#' - Retrieve all tissue site detail information in the database
#'
#'[GTEx Portal API
#'documentation](https://gtexportal.org/api/v2/redoc#tag/Datasets-Endpoints/operation/get_tissue_site_detail_api_v2_dataset_tissueSiteDetail_get)
#'
#'@inheritParams gtexr_arguments
#'@return A Tibble
#'@export
#'@family Datasets Endpoints
#'
#' @examples
#' get_tissue_site_detail()
get_tissue_site_detail <- function(page = 0,
                                   itemsPerPage = 250){
  gtex_query(endpoint = "dataset/tissueSiteDetail")
}
