#' Recode Report Card marks to Met Standard / Did not Meet Standard
#'
#' @param x
#'
#' @return Character vector with Met Standard / Did not Meet Standard
#' @export
#'

obt_recode_rc_L34 <- function (x){

  at_standard <- c(as.character(c(70:100)),
                   "B-", "B", "B+",
                   "A-", "A", "A+"
  )
  below_standard <- c(as.character (c(0:69)),
                       "C-", "C", "C+",
                       "D-", "D", "D+",
                       "R", "I")

  y <- dplyr::case_when (
    x %in% at_standard ~ "met_standard",
    x %in% below_standard ~ "did_not_meet_standard",
    TRUE ~ x)

  y
}

