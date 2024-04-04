#' Get Variant
#'
#' [This service returns information about a variant, including position, dbSNP
#' RS ID, the reference allele, the alternative allele, and whether the minor
#' allele frequency is >=
#' 1%.](https://gtexportal.org/api/v2/redoc#tag/Datasets-Endpoints/operation/get_variant_api_v2_dataset_variant_get)
#'
#' For GTEx v6p, there is also information about whether the whole exome
#' sequence and chip sequencing data are available. Results may be queried by
#' GTEx variant ID (variantId), dbSNP RS ID (snpId) or genomic location
#' (chromosome and pos). Variants are identified based on the genotype data of
#' each dataset cohort, namely, are dataset-dependent. Each variant is assigned
#' a unique GTEx variant ID (i.e. the primary key). Not all variants have a
#' mappable dbSNP RS ID. By default, this service queries the latest GTEx
#' release.
#'
#' Note: searching by chromosome and position can be more easily achieved using
#' [get_variant_by_location()].
#'
#' @param snpId String.
#' @param variantId String.
#' @param datasetId String.
#' @param chromosome String.
#' @param pos Integer, vector.
#' @param page Integer.
#' @param itemsPerPage Integer.
#'
#' @return A tibble.
#' @export
#' @family Datasets Endpoints
#'
#' @examples
#' # search by rsid
#' get_variant(snpId = "rs1410858")
#'
#' # search by variantId
#' get_variant(variantId = "chr1_153209640_C_A_b38")
#'
#' # search by chromosome and position
#' get_variant(chromosome = "chr1",
#'             pos = 153209600:153209700)
get_variant <- function(snpId = NULL,
                        variantId = NULL,
                        chromosome = NULL,
                        pos = NULL,
                        datasetId = "gtex_v8",
                        page = 0,
                        itemsPerPage = 250) {

  if (is.null(snpId) & is.null(variantId) & (is.null(chromosome) | is.null(pos))) {
    cli::cli_abort(c("Either `snpId` or `variantId` must be provided, or both `chromosome` and `pos`.",
                             "i" = "See {.fn ?get_variant} for examples"))
  }

  gtex_query(endpoint = "dataset/variant")
}