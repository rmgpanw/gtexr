#' Get News Item
#'
#' Getting all the news items from the database that are current.
#'
#' @param page Integer (default = 0).
#' @param itemsPerPage Integer (default = 250).
#'
#' @return List.
#' @export
#'
#' @examples
#' get_news_item()
get_news_item <- function(page = 0,
                          itemsPerPage = 250) {
  gtex_query(endpoint = "admin/newsItem")
}
