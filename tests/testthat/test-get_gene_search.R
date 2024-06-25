test_that("`get_gene_search()` returns tibble with expected colnames", {
  skip_if_offline()
  result <- get_gene_search("CRP")

  expect_s3_class(result, "tbl_df")

  expect_identical(
    names(result),
    c(
      "chromosome",
      "dataSource",
      "description",
      "end",
      "gencodeId",
      "gencodeVersion",
      "geneStatus",
      "geneSymbol",
      "geneSymbolUpper",
      "geneType",
      "genomeBuild",
      "start",
      "strand",
      "tss",
      "entrezGeneId"
    )
  )
})
