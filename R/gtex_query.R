base_url <- "https://gtexportal.org/api/v2/"

gtex_query <- function(endpoint = NULL) {

  # build request
  gtex_request <- httr2::request(base_url)

  # append endpoint
  if (!is.null(endpoint)) {
    gtex_request <- gtex_request |>
      httr2::req_url_path_append(endpoint)
  }

  # append query parameters

  query_params <- rlang::fn_fmls_names(rlang::caller_fn())

  if (!is.null(query_params)) {

    query_params <- rlang::env_get_list(env = rlang::caller_env(n = 1),
                                        nms = query_params) |>
      purrr::compact() |>
      purrr::imap(\(x, idx) purrr::set_names(as.list(x), idx)) |>
      purrr::flatten()

    gtex_request <- gtex_request |>
      httr2::req_url_query(!!!query_params)
  }

  gtex_response <- gtex_request |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  # print paging info
  cli::cli_h1("Paging info")
  gtex_response$paging_info |>
    purrr::imap_chr(\(x, idx) paste(idx, x, sep = " = ")) |>
    purrr::set_names(nm = "*") %>%
    cli::cli_bullets()

  return(gtex_response)
}
