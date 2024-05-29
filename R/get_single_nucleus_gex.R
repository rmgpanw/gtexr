#'Get Single Nucleux Gex
#'
#'@description Retrieve Single Nucleus Gene Expression Data for a given Gene.
#'
#'[GTEx Portal API
#'documentation](https://gtexportal.org/api/v2/redoc#tag/Expression-Data-Endpoints/operation/get_single_nucleus_gex_api_v2_expression_singleNucleusGeneExpression_get)
#'
#'@inheritParams gtexr_arguments
#'
#'@return A Tibble
#'@export
#'@family Expression Data Endpoints
#'
#' @examples
#' \dontrun{
#' # Search for one or more genes
#' get_single_nucleus_gex(gencodeIds = c("ENSG00000203782.5",
#'                                       "ENSG00000132693.12"))
#'
#' # Returns a tibble with one row per tissue
#' response <- get_single_nucleus_gex(gencodeIds = "ENSG00000132693.12",
#'                                    excludeDataArray = FALSE,
#'                                    itemsPerPage = 2)
#'
#' response
#'
#' # Column "cellTypes" contains a tibble of data with one row for each cell type
#' # e.g. for Breast_Mammary_Tissue,
#' response$cellTypes[[2]]
#'
#' # Expression values are stored in "data" e.g. for Breast_Mammary_Tissue,
#' # Epithelial cell (luminal):
#' response$cellTypes[[2]]$data[[1]]
#' }
get_single_nucleus_gex <- function(gencodeIds,
                                   datasetId = "gtex_snrnaseq_pilot",
                                   tissueSiteDetailIds = NULL,
                                   excludeDataArray = TRUE,
                                   page = 0,
                                   itemsPerPage = 250) {
  gtex_query(endpoint = "expression/singleNucleusGeneExpression",
             return_raw = TRUE)$data |>

    # returns a list of lists, with one list for each tissue type. Aim: return a
    # single row tibble for each tissue type
    purrr::map(\(x) {
      result <- x |>

        # for each tissue type, convert "cellTypes" item to a tibble
        purrr::map_if(is.list,
                      # "cellTypes" column is a list of lists, one list
                      # for each cell type
                      \(x) purrr::map(x, \(x) {

                        # process 'data', if `excludeDataArray` is `FALSE`
                        data_values <- unlist(x$data)

                        if (!is.null(data_values)) {
                          x$data <- list(data_values)
                        }

                        x |>
                          purrr::compact() |>
                          tibble::as_tibble()
                      }))

      x$cellTypes <- list(dplyr::bind_rows(result$cellTypes))

      tibble::as_tibble(x)
    }) |>
    dplyr::bind_rows()
}