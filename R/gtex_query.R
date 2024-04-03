base_url <- "https://gtexportal.org/api/v2/"

gtex_query <- function(endpoint = NULL,
                       return_raw = FALSE) {

  # build request
  gtex_request <- httr2::request(base_url)

  # append endpoint
  if (!is.null(endpoint)) {
    gtex_request <- gtex_request |>
      httr2::req_url_path_append(endpoint)
  }

  # append query parameters
  query_params <- NULL
  fn <- rlang::caller_fn()

  # allows gtex_query() to be called directly
  if (!is.null(fn)) {
    query_params <- rlang::fn_fmls_names(fn)
  }

  if (!is.null(query_params)) {
    # create a named list of argument-value pairs
    query_params <- rlang::env_get_list(env = rlang::caller_env(n = 1),
                                        nms = query_params)

    empty_query_params <- query_params |>
      purrr::keep(rlang::is_missing)

    if (length(empty_query_params) > 0) {
      cli::cli_abort(
        c(
          "Identified {length(empty_query_params)} argument{?s} with no default value{?s} provided: ",
          "{paste(names(empty_query_params), sep = '', collapse = ', ')}"
        ),
        call = rlang::caller_env()
      )
    }

    query_params <- query_params |>
      purrr::compact() |>
      purrr::imap(\(x, idx) purrr::set_names(as.list(x), idx)) |>
      purrr::flatten()

    # convert these to query parameters
    gtex_request <- gtex_request |>
      httr2::req_url_query(!!!query_params)
  }

  gtex_response <- gtex_request |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  if (return_raw) {
    return(gtex_response)
  }

  if (!is.null(gtex_response[["paging_info"]])) {
    if ((gtex_response$paging_info$totalNumberOfItems > gtex_response$paging_info$maxItemsPerPage) &
        is.null(query_params[["itemsPerPage"]])) {

      cli::cli_alert_info("Requesting all available {gtex_response$paging_info$totalNumberOfItems} items.")

      gtex_response <- gtex_request |>
        httr2::req_url_query(itemsPerPage = gtex_response$paging_info$totalNumberOfItems) |>
        httr2::req_perform() |>
        httr2::resp_body_json()

    } else if ((gtex_response$paging_info$totalNumberOfItems > gtex_response$paging_info$maxItemsPerPage) &
               !is.null(query_params[["itemsPerPage"]])) {

      cli::cli_h1(cli::col_yellow("Warning!"))
      cli::cli_alert_warning(
        c(
          "Total number of items ({gtex_response$paging_info$totalNumberOfItems}) ",
          "exceeds maximum page size ({gtex_response$paging_info$maxItemsPerPage})."
        ),
        wrap = TRUE
      )
      cli::cli_alert_info(c("i" = "Try increasing `itemsPerPage`, or set this to `NULL` to return all available items in one page."))
    }

    # print paging info
    cli::cli_h1("Paging info")
    gtex_response$paging_info |>
      purrr::imap_chr(\(x, idx) paste(idx, x, sep = " = ")) |>
      purrr::set_names(nm = "*") |>
      cli::cli_bullets()

    result <- gtex_response$data |>
      purrr::map(\(x) x |>
                   purrr::compact() |>
                   tibble::as_tibble()) |>
      dplyr::bind_rows()

  } else {
    result <- gtex_response |>
      tibble::as_tibble()
  }

  return(result)

}
