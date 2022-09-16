
#' Recode Report Card Marks to Achievement Levels
#'
#' This function takes report card marks, both alpha (A+, B, C-, etc.) and numeric (68, 72, 86, etc.)
#' and converts to achievement levels used in Ontario school boards
#'
#' @param x
#'
#' @return Character vector with achievement levels (NE1, Level 1, Level 2, Level 3, Level 4)
#' @export


obt_recode_rc_to_levels <- function (x){

  NE1 <- c(as.character(c(0:49)), "I", "R")
  level1 <- c(as.character (c(50:59)), "D-", "D", "D+")
  level2 <- c(as.character (c(60:69)), "C-", "C", "C+")
  level3 <- c(as.character (c(70:79)), "B-", "B", "B+")
  level4 <- c(as.character (c(80:100)), "A-", "A", "A+")

  y <- dplyr::case_when (
    x %in% NE1 ~ "NE1",
    x %in% level1 ~ "Level 1",
    x %in% level2 ~ "Level 2",
    x %in% level3 ~ "Level 3",
    x %in% level4 ~ "Level 4",
    TRUE ~ x)

  y
  }

