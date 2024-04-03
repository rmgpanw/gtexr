#' Get Gene Search
#'
#' [Find genes that are partial or complete match of a
#' gene_id](https://gtexportal.org/api/v2/redoc#tag/Reference-Genome-Endpoints/operation/get_gene_search_api_v2_reference_geneSearch_get)
#'
#' - gene_id could be a gene symbol, a gencode ID, or an Ensemble ID
#' - Gencode Version and Genome Build must be specified
#'
#' @param geneId String.
#' @param gencodeVersion String (default = "v26"). GENCODE annotation release.
#'   Either "v26" or "v19".
#' @param genomeBuild String (default = "GRCh38/hg38"). Either "GRCh38/hg38" or
#'   "GRCh37/hg19".
#' @param page Integer.
#' @param itemsPerPage Integer.
#'
#' @return A tibble.
#' @export
#' @family Reference Genome Endpoints
#'
#' @examples
#' get_gene_search("CRP")
get_gene_search <- function(geneId,
                            gencodeVersion = "v26",
                            genomeBuild = "GRCh38/hg38",
                            page = 0,
                            itemsPerPage = 250) {
  gtex_query(endpoint = "reference/geneSearch")
}
