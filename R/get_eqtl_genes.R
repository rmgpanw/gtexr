get_eqtl_genes <- function(tissueSiteDetailId,
                           datasetId = "gtex_v8",
                           page = NULL,
                           itemsPerPage = 250) {
  gtex_response <- gtex_query(endpoint = "association/egene")

  # Return data as a tibble
  gtex_response$data |>
    purrr::map(tibble::as_tibble) |>
    dplyr::bind_rows()
}
