test_that("`get_eqtl_genes()` returns tibble with expected colnames", {
  skip_if_offline()
  result <- suppressWarnings(get_eqtl_genes("Whole_Blood", itemsPerPage = 1))

  expect_s3_class(result, "tbl_df")

  expect_identical(
    names(result),
    c(
      "tissueSiteDetailId",
      "ontologyId",
      "datasetId",
      "empiricalPValue",
      "gencodeId",
      "geneSymbol",
      "log2AllelicFoldChange",
      "pValue",
      "pValueThreshold",
      "qValue"
    )
  )
})
