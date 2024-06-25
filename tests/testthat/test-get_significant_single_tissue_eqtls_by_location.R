test_that(
  "`get_significant_single_tissue_eqtls_by_location()` returns tibble with expected colnames",
  {
    skip_if_offline()
    result <-
      get_significant_single_tissue_eqtls_by_location(
        tissueSiteDetailId = "Artery_Aorta",
        start = 240000,
        end = 250000,
        chromosome = "chr11"
      )

    expect_s3_class(result, "tbl_df")

    expect_identical(
      names(result),
      c(
        "chromosome",
        "datasetId",
        "gencodeId",
        "geneSymbol",
        "geneSymbolUpper",
        "nes",
        "pValue",
        "pos",
        "snpId",
        "tissueSiteDetailId",
        "variantId"
      )
    )
  }
)
