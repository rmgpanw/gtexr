#' Get Neighbor Gene
#' Find all neighboring genes on a certain chromosome around a position with a certain window size.
#'
#' @inheritParams gtexr_arguments
#'
#' @return A tibble.
#' @export
#' @family Reference Genome Endpoints
#'
#' @examples
#' get_neighbor_gene(pos = 1000000, chromosome = "chr1", bp_window = 10000)
get_neighbor_gene <- function(pos,
                                         chromosome,
                                         bp_window,
                                         page = 0,
                                         itemsPerPage = 250) {
  gtex_query(endpoint = "reference/neighborGene")
}
