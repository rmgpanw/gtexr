test_that("`get_variant()` returns tibble with expected colnames", {
  skip_if_offline()
  result <- get_variant(snpId = "rs1410858")

  expect_s3_class(result, "tbl_df")

  expect_identical(
    names(result),
    c(
      "snpId",
      "b37VariantId",
      "pos",
      "maf01",
      "variantId",
      "alt",
      "chromosome",
      "snpIdUpper",
      "datasetId",
      "ref"
    )
  )
})
