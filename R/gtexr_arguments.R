#' gtexr arguments
#'
#' Internal function that documents all arguments for exported gtexr functions
#' that wrap GTEx Portal API endpoints (using roxygen `@inheritParams` tag).
#'
#' @param chromosome String. One of `r valid_chromosome_values(TRUE)`.
#' @param datasetId String. Unique identifier of a dataset. Usually includes a
#'   data source and data release. Options: `r valid_datasetId_values(TRUE)`.
#'   Default = "gtex_v8".
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
