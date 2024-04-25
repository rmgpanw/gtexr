#' Calculate Expression Quantitative Trait Loci
#'
#' [Calculate your own
#' eQTLs](https://gtexportal.org/api/v2/redoc#tag/Dynamic-Association-Endpoints/operation/calculate_expression_quantitative_trait_loci_api_v2_association_dyneqtl_get)
#'
#' Notes on output:
#'
#' * Beta and standard error are recorded in columns `nes` and `error` respectively (see [GTEx FAQs](https://gtexportal.org/home/faq#nes_beta))
#' * `variantId` contains (in order) chromosome, position, reference allele, alternative allele and human genome build separated by underscores. The reference and alternative alleles for "chr1_13550_G_A_b38" for example are "G" and "A" respectively.
#'
#' Notes on input:
#'
#' * Argument `variantId` also accepts RSIDs.
#'
#' @inheritParams gtexr_arguments
#'
#' @return A tibble.
#' @export
#' @family Dynamic Association Endpoints
#'
#' @examples
#' # perform request - returns a tibble with a single row
#' calculate_eqtls(tissueSiteDetailId = "Whole_Blood",
#'                 gencodeId = "ENSG00000203782.5",
#'                 variantId = "rs79641866")
#'
#' # unnest list columns with tidyr::unnest()
#' calculate_eqtls(tissueSiteDetailId = "Whole_Blood",
#'                 gencodeId = "ENSG00000203782.5",
#'                 variantId = "rs79641866") |>
#'   tidyr::unnest(c("data", "genotypes"))
calculate_eqtls <- function(tissueSiteDetailId,
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
