test_that("`get_sqtl_genes()` returns tibble with expected colnames", {
  skip_if_offline()
  result <- suppressWarnings(get_sqtl_genes("Whole_Blood", itemsPerPage = 1))

  expect_s3_class(result, "tbl_df")

  expect_identical(
    names(result),
    c(
      "nPhenotypes",
      "pValueThreshold",
      "phenotypeId",
      "geneSymbol",
      "pValue",
      "datasetId",
      "empiricalPValue",
      "tissueSiteDetailId",
      "ontologyId",
      "qValue",
      "gencodeId"
    )
  )
})
