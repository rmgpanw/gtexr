#' Download
#'
#' @description
#' [GTEx Portal API
#' documentation](https://gtexportal.org/api/v2/redoc#tag/Biobank-Data-Endpoints/operation/download_api_v2_biobank_download_get)
#'
#' @details
#' Note: running this request with no filters (i.e. `download()`) raises an error.
#'
#'
#' @inheritParams gtexr_arguments
#' @return A tibble
#' @export
#' @family Biobank Data Endpoints
#'
#' @examples
#' \dontrun{
#' download(
#'   materialTypes = "RNA:Total RNA",
#'   tissueSiteDetailIds = "Thyroid",
#'   pathCategory = "clean_specimens",
#'   sex = "male",
#'   ageBrackets = "50-59"
#' )
#' }
download <- function(materialTypes = NULL,
                     tissueSiteDetailIds = NULL,
                     pathCategory = NULL,
                     tissueSampleIds = NULL,
                     sex = NULL,
                     sortBy = NULL,
                     sortDirection = NULL,
                     searchTerm = NULL,
                     sampleIds = NULL,
                     subjectIds = NULL,
                     ageBrackets = NULL,
                     hardyScales = NULL,
                     hasExpressionData = NULL,
                     hasGenotype = NULL) {
  result <- gtex_query(endpoint = "biobank/download", return_raw = TRUE)

  result |>
    purrr::map(
      \(x) x |>
        purrr::map_at("pathologyNotesCategories", tibble::as_tibble) |>
        purrr::compact() |>
        tibble::as_tibble(),
      .progress = TRUE
    ) |>
    dplyr::bind_rows()
}
