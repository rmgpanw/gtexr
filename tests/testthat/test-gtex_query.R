with_mock_dir("gtex_query", {
  test_that("Call gtex_query() with no endpoint and no arguments", {
    expect_equal(nrow(get_service_info()), 1L)
  })

  test_that("Call gtex_query() with arguments", {
    expect_equal(nrow(suppressWarnings(get_gene_search("CRP", itemsPerPage = 1))), 1L)
  })

  test_that("gtex_query() raises a warning if total n items exceeds page size", {
    expect_warning(get_gene_search("CRP", itemsPerPage = 1))
  })
})