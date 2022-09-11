
#' Summary Table
#'
#' Given a dataframe or tibble, returns a tibble with counts and percentages
#' of a group. Can be a single group, or group 2 can be nested within group 1
#'
#' @param
#' df
#' @param
#' group_1
#' @param
#' group_2
#' @param
#' ...
#'
#' @return A tibble with counts and percentages of each group
#' @export
#'
#' @examples
#' dat <- palmerpenguins::penguins
#' obt_summary_table (dat, species)
#' obt_summary_table (dat, species, sex)
obt_summary_table <- function (df, group_1, group_2, ...){

  args <- match.call ()
  exist <- ("group_2" %in% names (args))
?
  tbl <- df |>
    dplyr::group_by({{group_1}}, {{group_2}}) |>
    dplyr::count ()

  if (exist == TRUE) {
    tbl |>
      dplyr::group_by ({{group_1}}) |>
      dplyr::mutate (perc = n / sum (n))}
  else {
    tbl |>
      dplyr::ungroup() |>
      dplyr::mutate(perc = n / sum(n))
  }
}
