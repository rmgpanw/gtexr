#' Get Gwas Catalog By Location
#' Find the GWAS Catalog on a certain chromosome between start and end locations.
#'
#' @inheritParams gtexr_arguments
#'
#' @return A tibble.
#' @export
#' @family Reference Genome Endpoints
#'
#' @examples
#' get_gwas_catalog_by_location(start = 1, end = 10000000, chromosome = "chr1")
get_gwas_catalog_by_location <- function(start,
                      end,
                      chromosome,
                      page = 0,
                      itemsPerPage = 250) {
  gtex_query(endpoint = "reference/gwasCatalogByLocation")
}
