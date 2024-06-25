test_that(
  "`calculate_splicing_quantitative_trait_loci()` returns tibble with expected colnames",
  {
    skip_if_offline()
    result <-
      calculate_splicing_quantitative_trait_loci(
        tissueSiteDetailId = "Whole_Blood",
        phenotypeId = "chr1:15947:16607:clu_40980:ENSG00000227232.5",
        variantId = "chr1_14677_G_A_b38"
      )

    expect_s3_class(result, "tbl_df")

    expect_identical(
      names(result),
      c(
        "data",
        "error",
        "genotypes",
        "hetCount",
        "homoAltCount",
        "homoRefCount",
        "maf",
        "nes",
        "pValue",
        "pValueThreshold",
        "phenotypeId",
        "tStatistic",
        "tissueSiteDetailId",
        "variantId"
      )
    )
  }
)
