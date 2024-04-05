
# Validate args function --------------------------------------------------

validate_args <- function(arguments,
                          fn_name,
                          call) {
  # see ?purrr::purrr_error_indexed - withCallingHandlers() is used here to get
  # rid of purrr's wrapper error
  withCallingHandlers(
    purrr::iwalk(arguments,
                 \(value, arg_name) eval(
                   rlang::call2(paste0("validate_arg_", arg_name),
                                value, call,
                                fn_name,
                                .ns = NULL)
                 )),
    purrr_error_indexed = function(err) {
      rlang::cnd_signal(err$parent)
    }
  )
}


# Validate arg functions --------------------------------------------------

validate_arg_chromosome <- function(x, call, ...) {

  if (!rlang::is_string(x)) {
    cli::cli_abort(c("`chromosome` must be a string",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = call)
  }

  if (!x %in% valid_chromosome_values()) {
    cli::cli_abort(c("Invalid `chromosome` value",
                     "x" = 'You supplied "{x}"',
                     "i" = "Valid options: {valid_chromosome_values(TRUE)}"),
                   call = call)
  }
}

validate_arg_datasetId <- function(x, call, ...) {
  if (!rlang::is_string(x)) {
    error_info <- ifelse(rlang::is_character(x),
                         yes = "You supplied a {.cls {class(x)}} of length {length(x)}",
                         no = "You supplied a {.cls {class(x)}}")

    cli::cli_abort(c("`datasetId` must be a string",
                     "x" = error_info),
                   call = call)
  }

  if (!x %in% valid_datasetId_values()) {
    cli::cli_abort(
      c(
        "Invalid `datasetId` value",
        "x" = 'You supplied "{x}"',
        "i" = "Valid options: {valid_datasetId_values(TRUE)}"
      ),
      call = call
    )
  }
}

validate_arg_end <- function(x, call, ...) {
  if (!rlang::is_scalar_integerish(x)) {
    cli::cli_abort(c("`end` must be an integer",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = call)
  }

  if (x < 0 | x > 250000000) {
    cli::cli_abort(c("`end` must be between 0 and 250000000",
                     "x" = "You supplied {x}"),
                   call = call)
  }
}

validate_arg_gencodeId <- function(x, call, fn_name) {
  if (fn_name %in% c(
    "get_multi_tissue_eqtls",
    "calculate_eqtls",
    "calculate_leqtls",
    "get_collapsed_gene_model_exon",
    "get_full_get_collapsed_gene_model_exon",
    "get_ld_data",
    "get_genes",
    "get_transcripts"
  )) {
    if (!rlang::is_string(x)) {
      error_info <- ifelse(rlang::is_character(x),
                           yes = "You supplied a {.cls {class(x)}} of length {length(x)}",
                           no = "You supplied a {.cls {class(x)}}")

      cli::cli_abort(c("`gencodeId` must be a string",
                       "x" = error_info),
                     call = call)
    }
  } else {
    if (!rlang::is_character(x)) {
      cli::cli_abort(
        c("`gencodeId` must be type character",
          "x" = "You supplied a {.cls {class(x)}}"),
        call = call
      )
    }
  }
}

validate_arg_gencodeVersion <- function(x, call, ...) {
  if (!rlang::is_string(x)) {
    cli::cli_abort(c("`gencodeVersion` must be a string",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = call)
  }

  if (!x %in% valid_gencodeVersion_values()) {
    cli::cli_abort(c("Invalid `gencodeVersion` value",
                     "x" = 'You supplied "{x}"',
                     "i" = "Valid options: {valid_gencodeVersion_values(TRUE)}"),
                   call = call)
  }
}

validate_arg_geneId <- function(x, call, fn_name) {
  if (fn_name ==
      "get_gene_search") {
    if (!rlang::is_string(x)) {
      error_info <- ifelse(rlang::is_character(x),
                           yes = "You supplied a {.cls {class(x)}} of length {length(x)}",
                           no = "You supplied a {.cls {class(x)}}")

      cli::cli_abort(c("`geneId` must be a string",
                       "x" = error_info),
                     call = call)
    }
  } else if (fn_name ==
             "get_genes") {
    if (!rlang::is_character(x)) {
      cli::cli_abort(
        c("`geneId` must be type character",
          "x" = "You supplied a {.cls {class(x)}}"),
        call = call
      )
    }
  }
}

validate_arg_genomeBuild <- function(x, call, ...) {
  if (!rlang::is_string(x)) {
    cli::cli_abort(c("`genomeBuild` must be a string",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = call)
  }

  if (!x %in% valid_genomeBuild_values()) {
    cli::cli_abort(c("Invalid `genomeBuild` value",
                     "x" = 'You supplied "{x}"',
                     "i" = "Valid options: {valid_genomeBuild_values(TRUE)}"),
                   call = call)
  }
}

validate_arg_itemsPerPage <- function(x, call, ...) {
  if (!rlang::is_scalar_integerish(x)) {
    cli::cli_abort(c("`itemsPerPage` must be an integer",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = call)
  }

  if (x < 0 | x > 100000) {
    cli::cli_abort(c("`itemsPerPage` must be between 0 and 100000",
                     "x" = "You supplied {x}"),
                   call = call)
  }
}

validate_arg_page <- function(x, call, ...) {
  if (!rlang::is_scalar_integerish(x)) {
    cli::cli_abort(c("`page` must be an integer",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = call)
  }

  if (x < 0 | x > 100000) {
    cli::cli_abort(c("`page` must be between 0 and 100000",
                     "x" = "You supplied {x}"),
                   call = call)
  }
}

validate_arg_pos <- function(x, call, fn_name) {
  if (fn_name == "get_neighbor_gene") {
    if (!rlang::is_scalar_integerish(x)) {
      error_info <- ifelse(rlang::is_integerish(x),
                           yes = "You supplied a {.cls {class(x)}} of length {length(x)}",
                           no = "You supplied a {.cls {class(x)}}")

      cli::cli_abort(c("`pos` must be a scalar integer",
                       "x" = error_info),
                     call = call)
    }
  } else if (fn_name == "get_variant") {
    if (!rlang::is_integerish(x)) {
      cli::cli_abort(c("`pos` must be an integer",
                       "x" = "You supplied a {.cls {class(x)}}"),
                     call = call)
    }
  }

  if (any(x < 0) | any(x > 248945542)) {
    cli::cli_abort(c("`pos` must be between 0 and 248945542",
                     "x" = "You supplied {x}"),
                   call = call)
  }
}

validate_arg_snpId <- function(x, call, ...) {
  if (!rlang::is_string(x)) {
    cli::cli_abort(c("`snpId` must be a string",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = call)
  }
}

validate_arg_sortDirection <- function(x, call, ...) {
  if (!rlang::is_string(x)) {
    cli::cli_abort(c("`sortDirection` must be a string",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = call)
  }

  if (!x %in% valid_sortDirection_values()) {
    cli::cli_abort(c("Invalid `sortDirection` value",
                     "x" = 'You supplied "{x}"',
                     "i" = "Valid options: {valid_sortDirection_values(TRUE)}"),
                   call = call)
  }
}

validate_arg_start <- function(x, call, ...) {
  if (!rlang::is_scalar_integerish(x)) {
    cli::cli_abort(c("`start` must be an integer",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = call)
  }

  if (x < 0 | x > 250000000) {
    cli::cli_abort(c("`start` must be between 0 and 250000000",
                     "x" = "You supplied {x}"),
                   call = call)
  }
}

validate_arg_tissueSiteDetailId <- function(x, call, fn_name) {
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
        call = call
      )
    }
  } else {
    if (!rlang::is_character(x)) {
      cli::cli_abort(
        c("`tissueSiteDetailId` must be type character",
          "x" = "You supplied a {.cls {class(x)}}"),
        call = call
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
      call = call
    )
  }
}

validate_arg_variantId <- function(x, call, ...) {
  if (!rlang::is_string(x)) {
    cli::cli_abort(c("`variantId` must be a string",
                     "x" = "You supplied a {.cls {class(x)}}"),
                   call = call)
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

valid_gencodeVersion_values <- function(single_string = FALSE) {
  result <- c("v26", "v19")

  if (single_string) {
    result <- paste0('"',
                     paste(
                       valid_gencodeVersion_values(FALSE),
                       sep = "",
                       collapse = '", "'
                     ),
                     '"')
  }

  return(result)
}

valid_genomeBuild_values <- function(single_string = FALSE) {
  result <- c("GRCh38/hg38", "GRCh37/hg19")

  if (single_string) {
    result <- paste0('"',
                     paste(
                       valid_genomeBuild_values(FALSE),
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

