#' Secondary Level of Study
#'
#' A function to re-code Ontario secondary courses into Level of Study (Academic, Applied, University, College, Open etc.)
#'
#' @param x
#' A vector containing an Ontario secondary course code with at least the first five digits (e.g. ENG2D, FSF3U, SNC1L)
#'
#' @return
#' A vector containing the course level for associated course code (e.g. ENG2D = Academic, FSF3U = University)
#' @export
#'
#' @examples
#' # obt_sec_level_study(sec_rc$course_number)
obt_sec_level_study <- function (x){

  level <- substr(x, 5,5)
  level <- dplyr::case_when(
    level == "D" ~ "Academic",
    level == "P" ~ "Applied",
    level == "U" ~ "University",
    level == "C" ~ "College",
    level == "O" ~ "Open",
    level == "L" ~ "Locally Developed",
    level == "E" ~ "Workplace",
    level == "M" ~ "University/College",
    level == "N" ~ "Alternative Education",
    level == "W" ~ "De-streamed",
    TRUE ~ level
    )

  return (level)

}

