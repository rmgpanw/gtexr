#' Calculate Expression Quantitative Trait Loci
#'
#' [Calculate your own
#' eQTLs](https://gtexportal.org/api/v2/redoc#tag/Dynamic-Association-Endpoints/operation/calculate_expression_quantitative_trait_loci_api_v2_association_dyneqtl_get)
#'
#' @param tissueSiteDetailId String. The ID of the tissue of interest. Can be a
#'   GTEx specific ID or an Ontology ID.
#' @param gencodeId String. A Versioned GENCODE ID of a gene, e.g.
#'   ENSG00000065613.9.
#' @param variantId String. A gtex variant ID.
#' @param datasetId String (default = "gtex_v8"). Options: "gtex_v8" or
#'   "gtex_snrnaseq_pilot". Unique identifier of a dataset. Usually includes a
#'   data source and data release.
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
