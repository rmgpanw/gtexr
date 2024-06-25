test_that("`calculate_isqtls()` returns tibble with expected colnames", {
  skip_if_offline()
  result <-
    calculate_isqtls(
      cellType = "Neutrophils",
      tissueSiteDetailId = "Whole_Blood",
      phenotypeId = "chr1:15947:16607:clu_40980:ENSG00000227232.5",
      variantId = "chr1_1099341_T_C_b38"
    )

  expect_s3_class(result, "tbl_df")

  expect_identical(
    names(result),
    c(
      "cellType",
      "data",
      "datasetId",
      "enrichmentScores",
      "phenotypeId",
      "tissueSiteDetailId",
      "variantId",
      "genotypes",
      "regressionCoord"
    )
  )
})
