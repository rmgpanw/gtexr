% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_gene_search.R
\name{get_gene_search}
\alias{get_gene_search}
\title{Get Gene Search}
\usage{
get_gene_search(
  geneId,
  gencodeVersion = "v26",
  genomeBuild = "GRCh38/hg38",
  page = 0,
  itemsPerPage = 250
)
}
\arguments{
\item{geneId}{String. A gene symbol, a gencode ID, or an Ensemble ID.}

\item{gencodeVersion}{String (default = "v26"). GENCODE annotation release.
Either "v26" or "v19".}

\item{genomeBuild}{String. Options: "GRCh38/hg38", "GRCh37/hg19". Default =
"GRCh38/hg38".}

\item{page}{Integer (default = 0).}

\item{itemsPerPage}{Integer (default = 250).}
}
\value{
A tibble.
}
\description{
Find genes that are partial or complete match of a gene_id
\itemize{
\item gene_id could be a gene symbol, a gencode ID, or an Ensemble ID
\item Gencode Version and Genome Build must be specified
}

\href{https://gtexportal.org/api/v2/redoc#tag/Reference-Genome-Endpoints/operation/get_gene_search_api_v2_reference_geneSearch_get}{GTEx Portal API documentation}
}
\examples{
\dontrun{
get_gene_search("CRP")
}
}
\seealso{
Other Reference Genome Endpoints: 
\code{\link{get_exons}()},
\code{\link{get_genes}()},
\code{\link{get_genomic_features}()},
\code{\link{get_gwas_catalog_by_location}()},
\code{\link{get_neighbor_gene}()},
\code{\link{get_transcripts}()}
}
\concept{Reference Genome Endpoints}
