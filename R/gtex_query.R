base_url <- "https://gtexportal.org/api/v2/"

gtex_query <- function(endpoint = NULL,
                       return_raw = FALSE) {

  # build request
  gtex_request <- httr2::request(base_url) |>
    httr2::req_user_agent("gtexr (https://github.com/rmgpanw/gtexr)")

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
          "Identified {length(empty_query_params)} missing argument{?s} with no default value{?s} provided: ",
          "{paste(names(empty_query_params), sep = '', collapse = ', ')}"
        ),
        call = rlang::caller_env()
      )
    }

    query_params <- query_params |>
      purrr::compact()

    # validate_args(arguments = query_params,
    #               fn_name = rlang::call_name(rlang::caller_call()),
    #               call = rlang::caller_env())

    # convert these to query parameters
    gtex_request <- gtex_request |>
      httr2::req_url_query(!!!query_params,
                           .multi = "explode")
  }

  gtex_response <- gtex_request |>
    httr2::req_error(is_error = \(resp) FALSE) |>
    httr2::req_perform()

  gtex_response_body <- gtex_response |>
    httr2::resp_body_json()

  # handle http errors
  switch(as.character(gtex_response$status_code),
         "422" = process_status_422(gtex_response_body,
                                  call = rlang::caller_env()),
         "400" = process_status_400(gtex_response_body,
                                  call = rlang::caller_env()))

  if (return_raw) {
    return(gtex_response_body)
  }

  if (!is.null(gtex_response_body[["paging_info"]])) {

    # warn user if not all available results fit on one page
    if ((gtex_response_body$paging_info$totalNumberOfItems > gtex_response_body$paging_info$maxItemsPerPage)) {

      cli::cli_warn(
        c("!" = "Total number of items ({gtex_response_body$paging_info$totalNumberOfItems}) exceeds maximum page size ({gtex_response_body$paging_info$maxItemsPerPage}).",
          "i" = "Try increasing `itemsPerPage`.")
      )
    }

    # print paging info
    cli::cli_h1("Paging info")
    gtex_response_body$paging_info |>
      purrr::imap_chr(\(x, idx) paste(idx, x, sep = " = ")) |>
      purrr::set_names(nm = "*") |>
      cli::cli_bullets()

    result <- gtex_response_body$data |>
      purrr::map(\(x) x |>
                   purrr::compact() |>
                   tibble::as_tibble()) |>
      dplyr::bind_rows()

  } else {
    result <- gtex_response_body |>
      tibble::as_tibble()
  }

  return(result)

}
