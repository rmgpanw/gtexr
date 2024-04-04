#' gtexr arguments
#'
#' Internal function that documents all arguments for exported gtexr functions
#' that wrap GTEx Portal API endpoints (using roxygen `@inheritParams` tag).
#'
#' @param chromosome String. One of "chr1", "chr2", "chr3", "chr4", "chr5",
#'   "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13",
#'   "chr14", "chr15", "chr16", "chr17", "chr18", "chr19", "chr20", "chr21",
#'   "chr22", "chrM", "chrX", "chrY".
#' @param datasetId String (default = "gtex_v8"). Options: "gtex_v8" or
#'   "gtex_snrnaseq_pilot". Unique identifier of a dataset. Usually includes a
#'   data source and data release.
#' @param end Integer.
#' @param gencodeId String. A Versioned GENCODE ID of a gene, e.g.
#'   ENSG00000065613.9.
#' @param gencodeVersion String (default = "v26"). GENCODE annotation release.
#'   Either "v26" or "v19".
#' @param geneId String.
#' @param genomeBuild String (default = "GRCh38/hg38"). Either "GRCh38/hg38" or
#'   "GRCh37/hg19".
#' @param itemsPerPage Integer (default = 250).
#' @param page Integer (default = 0).
#' @param pos Integer, vector.
#' @param snpId String
#' @param sortDirection String (default = "asc"). Either "asc" or "desc".
#' @param start Integer.
#' @param tissueSiteDetailId String. The ID of the tissue of interest. Can be a
#'   GTEx specific ID (e.g. "Whole_Blood"; use [available_tissueSiteDetailIds()]
#'   to see valid values) or an Ontology ID.
#' @param variantId String. A gtex variant ID.
#'
#' @keywords internal
#' @return Returns `NULL` invisibly. Used for documentation only.
gtexr_arguments <- function() {
  invisible(NULL)
}
