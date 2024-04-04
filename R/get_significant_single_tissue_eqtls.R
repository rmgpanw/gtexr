#' Get Significant Single Tissue Eqtls
#'
#' [Find significant single tissue
#' eQTLs.](https://gtexportal.org/api/v2/redoc#tag/Static-Association-Endpoints/operation/get_significant_single_tissue_eqtls_api_v2_association_singleTissueEqtl_get)
#'
#' - This service returns precomputed significant single tissue eQTLs.
#' - Results may be filtered by tissue, gene, variant or dataset.
#' - To search by gene, use the versioned GENCODE ID.
#' - To search by variant, use the gtex variant ID.
#'
#' **Note:** although the GTEx Portal API documentation says to use the dbSNP rsID
#' when searching by variant, this returns no results. Instead use gtex variant
#' IDs e.g. use "chr1_153209640_C_A_b38" instead of "rs1410858".
#'
#' @inheritParams gtexr_arguments
#'
#' @return A tibble.
#' @export
#' @family Static Association Endpoints
#'
#' @examples
#' # search by gene
#' get_significant_single_tissue_eqtls(gencodeId = c("ENSG00000132693.12",
#'                                                   "ENSG00000203782.5"))
#'
#' # search by variant - must be variantId (not rsid)
#' get_significant_single_tissue_eqtls(variantId = "chr1_153209640_C_A_b38")
#'
#' # filter by gene/variant and tissue site - either `gencodeId` or `variantId`
#' # should be supplied as a minimum
#' get_significant_single_tissue_eqtls(gencodeId = c("ENSG00000132693.12",
#'                                                   "ENSG00000203782.5"),
#'                                     variantId = "chr1_153209640_C_A_b38",
#'                                     tissueSiteDetailId = "Whole_Blood")
get_significant_single_tissue_eqtls <- function(gencodeId = NULL,
                                                variantId = NULL,
                                                tissueSiteDetailId = NULL,
                                                datasetId = "gtex_v8",
                                                page = 0,
                                                itemsPerPage = 250) {
  if (is.null(gencodeId) & is.null(variantId)) {
    cli::cli_abort(c("Either `gencodeId` or `variantId` must be provided",
                             "i" = "See {.fn ?get_significant_single_tissue_eqtls}"))
  }

  gtex_query(endpoint = "association/singleTissueEqtl")
}
