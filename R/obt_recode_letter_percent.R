

#' Recode Letter to Percent
#'
#' A function to recode alpha report card marks (A, B-, D+) to Numeric values.

#' @param x
#' A vector of report card marks containing alpha marks, or a combination of alpha and mumeric marks.
#'
#' @return
#' Numeric vector
#' @export
#'
#' @examples
#' # ele_rc$reading_numeric <- obt_recode_letter_percent(ele_rc$reading_numeric)
obt_recode_letter_percent <- function (x){

  # Separate out Grades 1-6 and grades 7-8

  G1_6 <-stringr::str_replace_all(x, "[0-9]+", "")
  G7_8 <- stringr::str_replace_all(x, "[A-Z]+", "")
  G7_8 <- stringr::str_replace_all(G7_8, "[^[:alnum:]]", "")

  # Recode Alpha to Numeric

  G1_6 <- dplyr::case_when (
    G1_6 == "A+" ~ "90",
    G1_6 == "A" ~ "85",
    G1_6 == "A-" ~ "80",
    G1_6 == "B+" ~ "78",
    G1_6 == "B" ~ "75",
    G1_6 == "B-" ~ "72",
    G1_6 == "C+" ~ "68",
    G1_6 == "C" ~ "65",
    G1_6 == "C-" ~ "62",
    G1_6 == "D+" ~ "58",
    G1_6 == "D" ~ "55",
    G1_6 == "D-" ~ "52",
    G1_6 == "D-" ~ "52",
    G1_6 == "R" ~ "45",
    TRUE ~ G1_6
    )

  # Combine back to single vector

  z <- paste0 (G1_6, G7_8)
  z <- ifelse (z == "I", NA,
               ifelse (z == "ALT", NA,
                       ifelse (z == "NA", NA,
                               ifelse (x == "W", NA,
                                       ifelse (x == "V", NA, z)
                                       )
                               )
                       )
  )
  # Convert to numeric
  z <- as.numeric(z)

  return (z)
  }




