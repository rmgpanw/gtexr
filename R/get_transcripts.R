#' Get Transcripts
#'
#' Find all transcripts of a reference gene.
#'
#' - This service returns information about transcripts of the given versioned GENCODE ID.
#' - A genome build and GENCODE version must be provided.
#' - By default, this service queries the genome build and GENCODE version used by the latest GTEx release.
#'
#' @inheritParams gtexr_arguments
#'
#' @return A tibble.
#' @export
#' @family Reference Genome Endpoints
#'
#' @examples
#' get_transcripts(gencodeId = "ENSG00000203782.5")
get_transcripts <- function(gencodeId,
                                         gencodeVersion = "v26",
                                         genomeBuild = "GRCh38/hg38",
                                         page = 0,
                                         itemsPerPage = 250) {
  gtex_query(endpoint = "reference/transcript")
}
