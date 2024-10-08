% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_expression_pca.R
\name{get_expression_pca}
\alias{get_expression_pca}
\title{Get Expression Pca}
\usage{
get_expression_pca(
  tissueSiteDetailIds,
  datasetId = "gtex_v8",
  sampleId = NULL,
  page = 0,
  itemsPerPage = 250
)
}
\arguments{
\item{tissueSiteDetailIds}{Character vector of IDs for tissues of interest.
Can be GTEx specific IDs (e.g. "Whole_Blood"; use
\code{\link[=get_tissue_site_detail]{get_tissue_site_detail()}} to see valid values) or Ontology IDs.}

\item{datasetId}{String. Unique identifier of a dataset. Usually includes a
data source and data release. Options: "gtex_v8", "gtex_snrnaseq_pilot".}

\item{sampleId}{String. \verb{^GTEX-[A-Z0-9]\{5\}-[0-9]\{4\}-SM-[A-Z0-9]\{5\}$}}

\item{page}{Integer (default = 0).}

\item{itemsPerPage}{Integer (default = 250).}
}
\value{
A tibble.
}
\description{
Find gene expression PCA data.
\itemize{
\item Returns gene expression PCA (principal component analysis) in tissues.
\item Results may be filtered by tissue, sample, or dataset.
}

By default, the service queries the latest GTEx release.

\href{https://gtexportal.org/api/v2/redoc#tag/Expression-Data-Endpoints/operation/get_expression_pca_api_v2_expression_expressionPca_get}{GTEx Portal API documentation}
}
\examples{
\dontrun{
get_expression_pca(tissueSiteDetailIds = c("Adipose_Subcutaneous",
                                           "Whole_Blood"))

get_expression_pca(tissueSiteDetailIds = "Adipose_Subcutaneous",
                   sampleId = "GTEX-1117F-0226-SM-5GZZ7")
}
}
\seealso{
Other Expression Data Endpoints: 
\code{\link{get_clustered_median_exon_expression}()},
\code{\link{get_clustered_median_gene_expression}()},
\code{\link{get_clustered_median_junction_expression}()},
\code{\link{get_clustered_median_transcript_expression}()},
\code{\link{get_gene_expression}()},
\code{\link{get_median_exon_expression}()},
\code{\link{get_median_gene_expression}()},
\code{\link{get_median_junction_expression}()},
\code{\link{get_median_transcript_expression}()},
\code{\link{get_single_nucleus_gex}()},
\code{\link{get_single_nucleus_gex_summary}()},
\code{\link{get_top_expressed_genes}()}
}
\concept{Expression Data Endpoints}
