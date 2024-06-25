test_that("`get_single_nucleus_gex()` returns tibble with expected colnames",
          {
            skip_if_offline()
            result <- get_single_nucleus_gex(gencodeIds = "ENSG00000132693.12", itemsPerPage = 1) |>
              suppressWarnings()

            expect_s3_class(result, "tbl_df")

            expect_identical(
              names(result),
              c(
                "tissueSiteDetailId",
                "ontologyId",
                "datasetId",
                "gencodeId",
                "geneSymbol",
                "cellTypes",
                "unit"
              )
            )
          })
