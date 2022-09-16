#' Recode Report Card marks to Pass/Fail
#'
#' All alpha and numeric marks are re-coded to either pass or fail, including R.
#' I remains the same as it's "Insufficient Evidence"
#'
#' @param x
#' Vector of report card marks. Can be either alpha (C+, B-, A) or numeric (88, 63, 79)
#'
#' @return Character vector with Pass/Fail
#' @export

obt_recode_rc_pass_fail <- function (x){

  pass <- c(as.character(c(50:100)),
            "D-", "D", "D+",
            "C-", "C", "C+",
            "B-", "B", "B+",
            "A-", "A", "A+"
            )
  fail <- c(as.character (c(0:49)),
            "R")

  y <- dplyr::case_when (
    x %in% pass ~ "pass",
    x %in% fail ~ "fail",
    TRUE ~ x)

  y
}


