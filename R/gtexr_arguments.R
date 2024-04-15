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
#' @param organizationName String. Options: "GTEx Consortium" "Kid's First".
#' @param page Integer (default = 0).
#' @param pos Integer, vector.
#' @param snpId String
#' @param sortDirection String. Options: "asc", "desc". Default = "asc".
#' @param start Integer.
#' @param tissueSampleId Array of strings. A list of Tissue Sample ID(s).
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
    ~arg, ~type, ~scalar, ~pluralised, ~shinyinput, ~choices,
    "bp_window", "integer", TRUE, FALSE, "numericInput", c(0, 248936581),
    "chromosome", "character", TRUE, FALSE, "selectInput", c(paste0("chr", 1:22), paste0("chr", c("M", "X", "Y"))),
    "datasetId", "character", TRUE, FALSE, "selectInput", c("gtex_v8", "gtex_snrnaseq_pilot"),
    "end", "integer", TRUE, FALSE, "numericInput", c(0, 250000000),
    "gencodeId", "character", TRUE, FALSE, "textInput", NA,
    "gencodeIds", "character", FALSE, TRUE, "textAreaInput", NA,
    "gencodeVersion", "character", TRUE, FALSE, "selectInput", c("v26", "v19"),
    "geneId", "character", TRUE, FALSE, "textInput", NA,
    "geneIds", "character", FALSE, TRUE, "textAreaInput", NA,
    "genomeBuild", "character", TRUE, FALSE, "selectInput", c("GRCh38/hg38", "GRCh37/hg19"),
    "itemsPerPage", "integer", TRUE, FALSE, "numericInput", c(0, 100000),
    "organizationName", "character", TRUE, FALSE, "selectInput", c("GTEx Consortium", "Kid's First"),
    "page", "integer", TRUE, FALSE, "numericInput", c(0, 1000000),
    "pos", "integer", FALSE, FALSE, "numericInput", c(0, 248945542),
    "snpId", "character", TRUE, FALSE, "textInput", NA,
    "sortDirection", "character", TRUE, FALSE, "selectInput", c("asc", "desc"),
    "start", "integer", TRUE, FALSE, "numericInput", c(0, 250000000),
    "tissueSampleId", "character", TRUE, FALSE, "selectInput", NA,
    "tissueSiteDetailId", "character", TRUE, FALSE, "selectInput", available_tissueSiteDetailIds(),
    "tissueSiteDetailIds", "character", FALSE, TRUE, "selectizeInput", available_tissueSiteDetailIds(),
    "variantId", "character", TRUE, FALSE, "textInput", NA
  )
}
