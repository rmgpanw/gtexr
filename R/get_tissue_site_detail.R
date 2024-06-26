#' Get Tissue Site Detail
#'
#' @description Retrieve all tissue site detail information in the database
#'
#' [GTEx Portal API
#' documentation](https://gtexportal.org/api/v2/redoc#tag/Datasets-Endpoints/operation/get_tissue_site_detail_api_v2_dataset_tissueSiteDetail_get)
#'
#' @inheritParams gtexr_arguments
#' @return A tibble
#' @export
#' @family Datasets Endpoints
#'
#' @examples
#' \dontrun{
#'   # returns a tibble with one row per tissue
#'   get_tissue_site_detail()
#'
#'   # `eqtlSampleSummary` and `rnaSeqSampleSummary` are list columns
#'   bladder_site_details <- get_tissue_site_detail() |>
#'     dplyr::filter(tissueSiteDetailId == "Bladder")
#'
#'   purrr::pluck(bladder_site_details, "eqtlSampleSummary", 1)
#'
#'   purrr::pluck(bladder_site_details, "rnaSeqSampleSummary", 1)
#' }
get_tissue_site_detail <- function(page = 0,
                                   itemsPerPage = 250){
  result <- gtex_query(endpoint = "dataset/tissueSiteDetail", return_raw = TRUE)

  paging_info_messages(result)

  result$data |>
    purrr::map(\(x) purrr::map_if(x, is.list, \(y) list(y))) |>
    dplyr::bind_rows()
}
