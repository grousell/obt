
#' Summary Table
#'
#' Given a dataframe or tibble, returns a tibble with counts and percentages
#' of a group. Can be a single group, or group 2 can be nested within group 1
#'
#' @param df
#' Dataframe or tibble
#' @param group_1
#' First grouping variable
#' @param group_2
#' Second grouping variable (optional)
#'
#'
#' @return A tibble with counts and percentages of each group
#' @export
#'
#' @importFrom rlang .data
#'
#' @examples
#' obt_summary_table (mtcars, gear)
#' obt_summary_table (mtcars, gear, carb)
obt_summary_table <- function (df, group_1, group_2){

  args <- match.call ()
  exist <- ("group_2" %in% names (args))

  tbl <- df |>
    dplyr::group_by({{group_1}}, {{group_2}}) |>
    dplyr::count ()

  if (exist == TRUE) {
    tbl |>
      dplyr::group_by ({{group_1}}) |>
      dplyr::mutate (perc = .data$n / sum (.data$n))}
  else {
    tbl |>
      dplyr::ungroup() |>
      dplyr::mutate(perc = .data$n / sum(.data$n))
  }
}

