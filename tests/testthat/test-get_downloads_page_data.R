test_that(
  "`get_downloads_page_data()` runs without error for `project_id` = 'gtex' (which returns no results)",
  {
    expect_equal(
      with_mocked_bindings(
        code = get_downloads_page_data("gtex"),
        gtex_query = function(...)
          list(data = list())
      ),
      tibble::tibble()
    )
  }
)
