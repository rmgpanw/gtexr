#' gtexr arguments
#'
#' Internal function that documents all arguments for exported gtexr functions
#' that wrap GTEx Portal API endpoints (using roxygen `@inheritParams` tag).
#'
#' @param bp_window Integer.
#' @param chromosome String. One of "chr1", "chr2", "chr3", "chr4", "chr5",
#'   "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13",
#'   "chr14", "chr15", "chr16", "chr17", "chr18", "chr19", "chr20", "chr21",
#'   "chr22", "chrM", "chrX", "chrY".
#' @param datasetId String. Unique identifier of a dataset. Usually includes a
#'   data source and data release. Options: "gtex_v8", "gtex_snrnaseq_pilot".
#'   Default = "gtex_v8".
#' @param end Integer.
#' @param gencodeId String. A Versioned GENCODE ID of a gene, e.g.
#'   "ENSG00000065613.9".
#' @param gencodeIds A character vector of Versioned GENCODE IDs, e.g.
#'   c("ENSG00000132693.12", "ENSG00000203782.5").
#' @param gencodeVersion String (default = "v26"). GENCODE annotation release.
#'   Either "v26" or "v19".
#' @param geneId String. A gene symbol, a gencode ID, or an Ensemble ID.
#' @param geneIds A character vector of gene symbols, versioned gencodeIds, or
#'   unversioned gencodeIds.
#' @param genomeBuild String. Options: "GRCh38/hg38", "GRCh37/hg19". Default =
#'   "GRCh38/hg38".
#' @param itemsPerPage Integer (default = 250).
#' @param page Integer (default = 0).
#' @param pos Integer, vector.
#' @param snpId String
#' @param sortDirection String. Options: "asc", "desc". Default = "asc".
#' @param start Integer.
#' @param tissueSiteDetailId String. The ID of the tissue of interest. Can be a
#'   GTEx specific ID (e.g. "Whole_Blood"; use [available_tissueSiteDetailIds()]
#'   to see valid values) or an Ontology ID.
#' @param tissueSiteDetailIds Character vector of IDs for tissues of interest.
#'   Can be GTEx specific IDs (e.g. "Whole_Blood"; use
#'   [available_tissueSiteDetailIds()] to see valid values) or Ontology IDs.
#' @param variantId String. A gtex variant ID.
#'
#' @keywords internal
#' @return Returns `NULL` invisibly. Used for documentation only.
gtexr_arguments <- function() {
  tibble::tribble(
    ~arg, ~type, ~scalar, ~pluralised,
    "bp_window", "integer", TRUE, FALSE,
    "chromosome", "character", TRUE, FALSE,
    "datasetId", "character", TRUE, FALSE,
    "end", "integer", TRUE, FALSE,
    "gencodeId", "character", TRUE, FALSE,
    "gencodeIds", "character", FALSE, TRUE,
    "gencodeVersion", "character", TRUE, FALSE,
    "geneId", "character", TRUE, FALSE,
    "geneIds", "character", FALSE, TRUE,
    "genomeBuild", "character", TRUE, FALSE,
    "itemsPerPage", "integer", TRUE, FALSE,
    "page", "integer", TRUE, FALSE,
    "pos", "integer", FALSE, FALSE,
    "snpId", "character", TRUE, FALSE,
    "sortDirection", "character", TRUE, FALSE,
    "start", "integer", TRUE, FALSE,
    "tissueSiteDetailId", "character", TRUE, FALSE,
    "tissueSiteDetailIds", "character", FALSE, TRUE,
    "variantId", "character", TRUE, FALSE
  )
}
