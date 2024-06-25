test_that(
  "`get_linkage_disequilibrium_by_variant_data()` returns tibble with expected colnames",
  {
    skip_if_offline()
    result <- get_linkage_disequilibrium_by_variant_data("chr1_159245536_C_T_b38", itemsPerPage = 1) |>
      suppressWarnings()

    expect_s3_class(result, "tbl_df")

    expect_identical(names(result), c("variantId_1", "variantId_2", "ld"))
  }
)
