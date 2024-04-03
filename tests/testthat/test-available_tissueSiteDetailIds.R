test_that("available_tissueSiteDetailIds() returns a character vector of expected length", {
  expect_vector(available_tissueSiteDetailIds(), ptype = character(), size = 55L)
})
