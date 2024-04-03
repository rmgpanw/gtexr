#' Get Maintenance Message
#'
#' Getting all the maintenance messages from the database that are enabled.
#'
#' @return A tibble.
#' @export
#' @family Admin Endpoints
#'
#' @examples
#' get_maintenance_message()
get_maintenance_message <- function() {
  gtex_query(endpoint = "admin/maintenanceMessage")
}
