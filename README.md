
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

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(gtexr)
## basic example code
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
