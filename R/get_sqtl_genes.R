#' Get sqtl Genes
#'
#' Retrieve sGenes (sQTL Genes).
#'
#' - This service returns sGenes (sQTL Genes) from the specified dataset.
#' - sGenes are genes that have at least one significant cis-sQTL acting upon them.
#' - Results may be filtered by tissue. By default, the service queries the latest GTEx release.
#'
#' For each sGene, the results include the allelic fold change
#' (log2AllelicFoldChange), p-value (pValue), p-value threshold
#' (pValueThreshold), empirical p-value (empiricalPValue), and q-value (qValue).
#'
#' - The log2AllelicFoldChange is the allelic fold change (in log2 scale) of the most significant sQTL.
#' - The pValue is the nominal p-value of the most significant sQTL.
#' - The pValueThreshold is the p-value threshold used to determine whether a cis-sQTL for this gene is significant. For more details see https://gtexportal.org/home/documentationPage#staticTextAnalysisMethods.
#' - The empiricalPValue is the beta distribution-adjusted empirical p-value from FastQTL.
#' - The qValues were calculated based on the empirical p-values. A false discovery rate (FDR) threshold of <= 0.05 was applied to identify genes with a significant sQTL.
#'
#' @inheritParams gtexr_arguments
#'
#' @return A tibble.
#' @export
#' @family Static Association Endpoints
#'
#' @examples
get_sqtl_genes <- function(tissueSiteDetailId,
                           datasetId = "gtex_v8",
                           page = 0,
                           itemsPerPage = 250){
  gtex_query(endpoint = "association/sgene")
}
