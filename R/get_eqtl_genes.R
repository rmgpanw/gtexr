#' Get Eqtl Genes
#'
#' Retrieve eGenes (eQTL Genes).
#'
#' - This service returns eGenes (eQTL Genes) from the specified dataset.
#' - eGenes are genes that have at least one significant cis-eQTL acting upon them.
#' - Results may be filtered by tissue. By default, the service queries the latest GTEx release.
#'
#' For each eGene, the results include the allelic fold change
#' (log2AllelicFoldChange), p-value (pValue), p-value threshold
#' (pValueThreshold), empirical p-value (empiricalPValue), and q-value (qValue).
#'
#' - The log2AllelicFoldChange is the allelic fold change (in log2 scale) of the most significant eQTL.
#' - The pValue is the nominal p-value of the most significant eQTL.
#' - The pValueThreshold is the p-value threshold used to determine whether a cis-eQTL for this gene is significant. For more details see https://gtexportal.org/home/documentationPage#staticTextAnalysisMethods.
#' - The empiricalPValue is the beta distribution-adjusted empirical p-value from FastQTL.
#' - The qValues were calculated based on the empirical p-values. A false discovery rate (FDR) threshold of <= 0.05 was applied to identify genes with a significant eQTL.
#'
#' @inheritParams gtexr_arguments
#'
#' @return A tibble.
#' @export
#' @family Static Association Endpoints
#'
#' @examples
#' get_eqtl_genes("Whole_Blood")
get_eqtl_genes <- function(tissueSiteDetailId,
                           datasetId = "gtex_v8",
                           page = NULL,
                           itemsPerPage = 250) {
  gtex_query(endpoint = "association/egene")
}
