#' Calculate Expression Quantitative Trait Loci
#'
#' [Calculate your own
#' eQTLs](https://gtexportal.org/api/v2/redoc#tag/Dynamic-Association-Endpoints/operation/calculate_expression_quantitative_trait_loci_api_v2_association_dyneqtl_get)
#'
#' @inheritParams gtexr_arguments
#'
#' @return A tibble.
#' @export
#' @family Dynamic Association Endpoints
#'
#' @examples
#' # perform request
#' result <- calculate_eqtl(tissueSiteDetailId = "Whole_Blood",
#'                gencodeId = "ENSG00000203782.5",
#'                variantId = "rs79641866")
#'
#' # returns a tibble with a single row
#' result
#'
#' # unnest list columns with tidyr::unnest()
#' tidyr::unnest(result, c("data", "genotypes"))
calculate_eqtl <- function(tissueSiteDetailId,
                           gencodeId,
                           variantId,
                           datasetId = "gtex_v8") {
  result <- gtex_query("association/dyneqtl",
             return_raw = TRUE)

  result$data <- list(tibble::tibble(data = as.numeric(result$data)))
  result$genotypes <- list(tibble::tibble(genotypes = as.integer(result$genotypes)))

  result <- tibble::as_tibble(result)

  return(result)
}
