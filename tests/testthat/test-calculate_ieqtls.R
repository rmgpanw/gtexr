test_that("`calculate_ieqtls()` returns tibble with expected colnames", {
  skip_if_offline()
  result <-
    calculate_ieqtls(
      cellType = "Adipocytes",
      tissueSiteDetailId = "Adipose_Subcutaneous",
      gencodeId = "ENSG00000203782.5",
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
      "gencodeId",
      "genotypes",
      "regressionCoord",
      "tissueSiteDetailId",
      "variantId"
    )
  )
})
