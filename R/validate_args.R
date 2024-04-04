
# Validate args function --------------------------------------------------


validate_args <- function(arguments,
                          fn) {
  arguments |>
    purrr::iwalk(\(value, arg_name) eval(rlang::call2(paste0(
      "validate_arg_", arg_name
    ), value)))

  invisible(TRUE)
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

  invisible(TRUE)
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
  TRUE
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
  TRUE
}

validate_arg_sortDirection <- function(x, ...) {
  TRUE
}

validate_arg_start <- function(x, ...) {
  TRUE
}

validate_arg_tissueSiteDetailId <- function(x, ...) {
  TRUE
}

validate_arg_variantId <- function(x, ...) {
  TRUE
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
