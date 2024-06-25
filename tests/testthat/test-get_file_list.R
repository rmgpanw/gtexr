test_that("`get_file_list()` returns tibble with expected colnames", {
  skip_if_offline()
  result <- get_file_list()

  expect_s3_class(result, "tbl_df")

  expect_identical(
    names(result),
    c(
      "name",
      "subpath",
      "dbgapId",
      "dataset",
      "release",
      "order",
      "type",
      "id",
      "description",
      "filesets"
    )
  )
})
