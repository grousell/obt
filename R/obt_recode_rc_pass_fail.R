#' Recode Report Card marks to Pass/Fail
#'
#' @param x
#'
#' @return Character vector with Pass/Fail
#' @export
#'
#' @examples
#' df <- ele_rc
#' ele_rc$reading
#' [1] "C+" "A-" "C"  "C"  "B-" "C-" "B-" "A-" "78" "D"  "R"  "B-" "60" "D"  "B-"
#'
#' obt_recode_rc_pass_fail(ele_rc$reading)
#' [1] "pass" "pass" "pass" "pass" "pass" "pass" "pass" "pass" "pass" "pass" "fail" "pass" "pass" "pass" "pass"
#'
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


