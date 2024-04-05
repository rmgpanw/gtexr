
# Validate args function --------------------------------------------------


validate_args <- function(arguments,
                          fn_name) {
  arguments |>
    purrr::iwalk(\(value, arg_name) eval(rlang::call2(paste0(
      "validate_arg_", arg_name
    ), value, fn_name, .ns = NULL)))
}


# Validate arg functions --------------------------------------------------



validate_arg_chromosome <- function(x, ...) {

  if (!rlang::is_string(x)) {
    cli::cli_abort(c("`chromosome` must be a string",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = rlang::caller_env(2))
  }

  if (!x %in% valid_chromosome_values()) {
    cli::cli_abort(c("Invalid `chromosome` value",
                     "x" = 'You supplied "{x}"',
                     "i" = "Valid options: {valid_chromosome_values(TRUE)}"),
                   call = rlang::caller_env(2))
  }
}

validate_arg_datasetId <- function(x, ...) {

  if (!rlang::is_string(x)) {
    cli::cli_abort(c("`datasetId` must be a string",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = rlang::caller_env(2))
  }

  if (!x %in% valid_datasetId_values()) {
    cli::cli_abort(c("Invalid `datasetId` value",
                     "x" = 'You supplied "{x}"',
                     "i" = "Valid options: {valid_datasetId_values(TRUE)}"),
                   call = rlang::caller_env(2))
  }
}

validate_arg_end <- function(x, ...) {
  if (!rlang::is_scalar_integerish(x)) {
    cli::cli_abort(c("`end` must be an integer",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = rlang::caller_env(2))
  }

  if (x < 0 | x > 250000000) {
    cli::cli_abort(c("`end` must be between 0 and 250000000",
                     "x" = "You supplied {x}"),
                   call = rlang::caller_env(2))
  }
}

validate_arg_gencodeId <- function(x, ...) {
  TRUE
}

validate_arg_gencodeVersion <- function(x, ...) {
  TRUE
}

validate_arg_geneId <- function(x, ...) {
  TRUE
}

validate_arg_genomeBuild <- function(x, ...) {
  TRUE
}

validate_arg_itemsPerPage <- function(x, ...) {
  TRUE
}

validate_arg_page <- function(x, ...) {
  TRUE
}

validate_arg_pos <- function(x, ...) {
  TRUE
}

validate_arg_snpId <- function(x, ...) {
  if (!rlang::is_string(x)) {
    cli::cli_abort(c("`snpId` must be a string",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = rlang::caller_env(2))
  }
}

validate_arg_sortDirection <- function(x, ...) {
  if (!rlang::is_string(x)) {
    cli::cli_abort(c("`sortDirection` must be a string",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = rlang::caller_env(2))
  }

  if (!x %in% valid_sortDirection_values()) {
    cli::cli_abort(c("Invalid `sortDirection` value",
                     "x" = 'You supplied "{x}"',
                     "i" = "Valid options: {valid_sortDirection_values(TRUE)}"),
                   call = rlang::caller_env(2))
  }
}

validate_arg_start <- function(x, ...) {
  if (!rlang::is_scalar_integerish(x)) {
    cli::cli_abort(c("`start` must be an integer",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = rlang::caller_env(2))
  }

  if (x < 0 | x > 250000000) {
    cli::cli_abort(c("`start` must be between 0 and 250000000",
                     "x" = "You supplied {x}"),
                   call = rlang::caller_env(2))
  }
}

validate_arg_tissueSiteDetailId <- function(x, fn_name) {
  if (fn_name %in% c(
    "calculate_eqtls",
    "calculate_leqtls",
    "calculate_sqtls",
    "calculate_lsqtls",
    "get_top_expressed_genes"
  )) {
    if (!rlang::is_string(x)) {
      error_info <- ifelse(rlang::is_character(x),
                           yes = "You supplied a {.cls {class(x)}} of length {length(x)}",
                           no = "You supplied a {.cls {class(x)}}")

      cli::cli_abort(
        c("`tissueSiteDetailId` must be a string",
          "x" = error_info),
        call = rlang::caller_env(2)
      )
    }
  } else {
    if (!rlang::is_character(x)) {
      cli::cli_abort(
        c("`tissueSiteDetailId` must be type character",
          "x" = "You supplied a {.cls {class(x)}}"),
        call = rlang::caller_env(2)
      )
    }
  }

  # validate value
  if (!all(x %in% available_tissueSiteDetailIds())) {
    cli::cli_abort(
      c(
        "Invalid `tissueSiteDetailId` value",
        "x" = 'You supplied "{x}"',
        "i" = 'Use `available_tissueSiteDetailIds()` to see valid options (e.g. "{paste(available_tissueSiteDetailIds()[1:3], sep = "", collapse = "\\", \\"")}")'
      ),
      call = rlang::caller_env(2)
    )
  }
}

validate_arg_variantId <- function(x, ...) {
  if (!rlang::is_string(x)) {
    cli::cli_abort(c("`variantId` must be a string",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = rlang::caller_env(2))
  }
}


# Utils -------------------------------------------------------------------

## Valid argument values ---------------------------------------------------

valid_chromosome_values <- function(single_string = FALSE) {
  result <- paste0("chr", c(1:22, "M", "X", "Y"))

  if (single_string) {
    result <- paste0('"',
                     paste(
                       valid_chromosome_values(FALSE),
                       sep = "",
                       collapse = '", "'
                     ),
                     '"')
  }

  return(result)
}

valid_datasetId_values <- function(single_string = FALSE) {
  result <- c("gtex_v8", "gtex_snrnaseq_pilot")

  if (single_string) {
    result <- paste0('"',
                     paste(
                       valid_datasetId_values(FALSE),
                       sep = "",
                       collapse = '", "'
                     ),
                     '"')
  }

  return(result)
}

valid_sortDirection_values <- function(single_string = FALSE) {
  result <- c("asc", "desc")

  if (single_string) {
    result <- paste0('"',
                     paste(
                       valid_sortDirection_values(FALSE),
                       sep = "",
                       collapse = '", "'
                     ),
                     '"')
  }

  return(result)
}

