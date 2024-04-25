test_that("available_tissueSiteDetailIds() has expected number of values", {
  expect_vector(available_tissueSiteDetailIds()$tissue, ptype = character(), size = 55L)
})
