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

# TODO - add test for `calculate_eqtls(tissueSiteDetailId = "Artery_Aorta",
# gencodeId = "ENSG00000116117", variantId = "rs147387290")` - returns `NULL`
# for "pValueThreshold". This doesn't however:
# `calculate_eqtls(tissueSiteDetailId = "Artery_Aorta", gencodeId =
# "ENSG00000225630", variantId = "rs554008981")`
