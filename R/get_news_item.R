#' Get News Item
#'
#' Getting all the news items from the database that are current.
#'
#' @inheritParams gtexr_arguments
#'
#' @return A tibble.
#' @export
#' @family Admin Endpoints
#'
#' @examples
#' get_news_item()
get_news_item <- function(page = 0,
                          itemsPerPage = 250) {
  gtex_query(endpoint = "admin/newsItem")
}
