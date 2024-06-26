#' Get Sample (Biobank Data)
#'
#' @description
#' [GTEx Portal API
#' documentation](https://gtexportal.org/api/v2/redoc#tag/Biobank-Data-Endpoints/operation/get_sample_api_v2_biobank_sample_get)
#'
#' @inheritParams gtexr_arguments
#' @return A tibble
#' @export
#' @family Biobank Data Endpoints
#'
#' @examples
#' \dontrun{
#'  get_sample_biobank_data(tissueSiteDetailIds = "Whole_Blood")
#' }
get_sample_biobank_data <- function(draw = NULL,
                                    materialTypes = NULL,
                                    tissueSiteDetailIds = NULL,
                                    pathCategory = NULL,
                                    tissueSampleIds = NULL,
                                    sex = NULL,
                                    sortBy = "sampleId",
                                    sortDirection = "asc",
                                    searchTerm = NULL,
                                    sampleIds = NULL,
                                    subjectIds = NULL,
                                    ageBrackets = NULL,
                                    hardyScales = NULL,
                                    hasExpressionData = NULL,
                                    hasGenotype = NULL,
                                    page = 0,
                                    itemsPerPage = 250) {
  resp_json <- gtex_query(endpoint = "biobank/sample", return_raw = TRUE)

  process_get_sample_biobank_data_resp_json(resp_json = resp_json)
}

process_get_sample_biobank_data_resp_json <- function(resp_json) {
  # warn user if not all available results fit on one page
  if ((resp_json$recordsFiltered > resp_json$pageSize)) {
    warning_message <-
      c(
        "!" = cli::format_inline(
          "Total number of items ({resp_json$recordsFiltered}) exceeds maximum page size ({resp_json$pageSize})."
        ),
        "i" = cli::format_inline("Try increasing `itemsPerPage`.")
      )

    cli::cli_warn(warning_message, message_unformatted = warning_message)
  }

  # print paging info
  cli::cli_h1("Paging info")
  resp_json |>
    purrr::discard_at("sample") |>
    tibble::as_tibble() |>
    dplyr::rename_with(
      \(x) dplyr::case_match(
        x,
        "numPages" ~ "numberOfPages",
        "pageSize" ~ "maxItemsPerPage",
        "recordsFiltered" ~ "totalNumberOfItems (recordsFiltered)",
        .default = x
      )
    ) |>
    dplyr::select(dplyr::all_of(
      c(
        "numberOfPages",
        "page",
        "maxItemsPerPage",
        "totalNumberOfItems (recordsFiltered)",
        "recordsTotal"
      )
    )) |>
    purrr::imap_chr(\(x, idx) paste(idx, x, sep = " = ")) |>
    purrr::set_names(nm = "*") |>
    cli::cli_bullets()

  resp_json$sample |>
    purrr::map(\(x) x |>
                 purrr::compact() |>
                 tibble::as_tibble()) |>
    dplyr::bind_rows()
}
