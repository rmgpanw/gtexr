test_that(
  "`calculate_expression_quantitative_trait_loci()` returns tibble with expected colnames",
  {
    skip_if_offline()
    result <-
      calculate_expression_quantitative_trait_loci(
        tissueSiteDetailId = "Whole_Blood",
        gencodeId = "ENSG00000203782.5",
        variantId = "rs79641866"
      )

    expect_s3_class(result, "tbl_df")

    expect_identical(
      names(result),
      c(
        "data",
        "error",
        "gencodeId",
        "geneSymbol",
        "genotypes",
        "hetCount",
        "homoAltCount",
        "homoRefCount",
        "maf",
        "nes",
        "pValue",
        "pValueThreshold",
        "tStatistic",
        "tissueSiteDetailId",
        "variantId"
      )
    )
  }
)
