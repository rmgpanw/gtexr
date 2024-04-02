
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gtexr

<!-- badges: start -->

[![pkgdown](https://github.com/rmgpanw/gtexr/actions/workflows/pkgdown.yaml/badge.svg)](https://github.com/rmgpanw/gtexr/actions/workflows/pkgdown.yaml)
<!-- badges: end -->

The goal of gtexr is to provide a convenient R interface to the [GTEx
Portal API
V2](https://gtexportal.org/api/v2/redoc#tag/GTEx-Portal-API-Info).

## Installation

You can install the development version of gtexr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("rmgpanw/gtexr")
```

## Examples

Get general information about the GTEx service:

``` r
library(gtexr)
get_service_info()
#> 
#> ── Paging info ─────────────────────────────────────────────────────────────────
#> $id
#> [1] "org.gtexportal.rest.v2"
#> 
#> $name
#> [1] "GTEx Portal V2 API"
#> 
#> $version
#> [1] "2.0.0"
#> 
#> $organization
#> $organization$name
#> [1] "GTEx Project"
#> 
#> $organization$url
#> [1] "https://gtexportal.org"
#> 
#> 
#> $description
#> [1] "This service provides access to the data powering the GTEx portal."
#> 
#> $contactUrl
#> [1] "https://gtexportal.org/home/contact"
#> 
#> $documentationUrl
#> [1] "https://gtexportal.org/api/v2/docs"
#> 
#> $environment
#> [1] "prod"
```

Retrieve eQTL genes for whole blood:

``` r
get_eqtl_genes("Whole_Blood")
#> 
#> ── Paging info ─────────────────────────────────────────────────────────────────
#> • numberOfPages = 50
#> • page = 0
#> • maxItemsPerPage = 250
#> • totalNumberOfItems = 12360
#> # A tibble: 250 × 10
#>    tissueSiteDetailId ontologyId  datasetId empiricalPValue gencodeId geneSymbol
#>    <chr>              <chr>       <chr>               <dbl> <chr>     <chr>     
#>  1 Whole_Blood        UBERON:001… gtex_v8          1.05e- 9 ENSG0000… WASH7P    
#>  2 Whole_Blood        UBERON:001… gtex_v8          1.06e-25 ENSG0000… RP11-34P1…
#>  3 Whole_Blood        UBERON:001… gtex_v8          6.31e- 2 ENSG0000… CICP27    
#>  4 Whole_Blood        UBERON:001… gtex_v8          8.71e- 9 ENSG0000… RP11-34P1…
#>  5 Whole_Blood        UBERON:001… gtex_v8          6.01e-20 ENSG0000… RP11-34P1…
#>  6 Whole_Blood        UBERON:001… gtex_v8          6.96e- 9 ENSG0000… RP11-34P1…
#>  7 Whole_Blood        UBERON:001… gtex_v8          3.10e- 4 ENSG0000… RP11-34P1…
#>  8 Whole_Blood        UBERON:001… gtex_v8          1.92e- 3 ENSG0000… ABC7-4304…
#>  9 Whole_Blood        UBERON:001… gtex_v8          1.58e- 3 ENSG0000… RP11-34P1…
#> 10 Whole_Blood        UBERON:001… gtex_v8          7.82e- 2 ENSG0000… AP006222.2
#> # ℹ 240 more rows
#> # ℹ 4 more variables: log2AllelicFoldChange <dbl>, pValue <dbl>,
#> #   pValueThreshold <dbl>, qValue <dbl>
```
