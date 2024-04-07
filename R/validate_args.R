

validate_args <- function(arguments,
                          call) {
  metadata <- gtexr_arguments()

  # see ?purrr::purrr_error_indexed - withCallingHandlers() is used here to get
  # rid of purrr's wrapper error
  withCallingHandlers(
    purrr::iwalk(arguments,
                 \(value, arg_name) {
                   arg_metadata <- metadata[metadata$arg == arg_name,]

                   error_msg <- ifelse(
                     arg_metadata$scalar,
                     yes = c(
                       "`{arg_name}` must be class {.cls {arg_metadata$type}} of length 1",
                       "x" = "You supplied a {.cls {class(x)}} of length {length(value)}"
                     ),
                     no = c(
                       "`{arg_name}` must be class {.cls {arg_metadata$type}}",
                       "x" = "You supplied class {.cls {class(x)}}"
                     )
                   )

                   valid_type <- FALSE

                   if (inherits(value, arg_metadata$type) |
                       ((arg_metadata$type == "integer") &
                        rlang::is_integerish(value))) {
                     valid_type <- TRUE
                   }

                   if (!valid_type |
                       (arg_metadata$scalar & length(value) > 1)) {
                     cli::cli_abort(error_msg,
                                    call = call)
                   }
                 }),
    purrr_error_indexed = function(err) {
      rlang::cnd_signal(err$parent)
    }
  )

  # if checks pass, rename any pluralised args
  pluralised_args <- metadata[metadata$pluralised,]$arg
  args_to_rename <- which(names(arguments) %in% pluralised_args)
  names(arguments)[args_to_rename] <-
    substr(names(arguments)[args_to_rename], 1, nchar(names(arguments)[args_to_rename]) - 1)

  return(arguments)
}
