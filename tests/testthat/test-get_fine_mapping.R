test_that("`get_fine_mapping()` returns tibble with expected colnames", {
  skip_if_offline()
  result <- suppressWarnings(get_fine_mapping(gencodeIds = "ENSG00000203782.5", itemsPerPage = 1))

  expect_s3_class(result, "tbl_df")

  expect_identical(
    names(result),
    c(
      "datasetId",
      "gencodeId",
      "method",
      "pip",
      "setId",
      "setSize",
      "tissueSiteDetailId",
      "ontologyId",
      "variantId"
    )
  )
})
