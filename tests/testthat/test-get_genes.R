test_that("`get_genes()` returns tibble with expected colnames", {
  skip_if_offline()
  result <- get_genes("CRP")

  expect_s3_class(result, "tbl_df")

  expect_identical(
    names(result),
    c(
      "chromosome",
      "dataSource",
      "description",
      "end",
      "entrezGeneId",
      "gencodeId",
      "gencodeVersion",
      "geneStatus",
      "geneSymbol",
      "geneSymbolUpper",
      "geneType",
      "genomeBuild",
      "start",
      "strand",
      "tss"
    )
  )
})
