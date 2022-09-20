
<!-- README.md is generated from README.Rmd. Please edit that file -->

# obt

<!-- badges: start -->

[![R-CMD-check](https://github.com/grousell/obt/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/grousell/obt/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of Ontario Board Tools (obt)) is to provide data professionals
in Ontario school boards (and elsewhere) tools to assist with data
cleaning and analyses of commonly used data sets. These include: -
Elementary and Secondary Report Card - EQAO

## Installation

You can install the development version of obt from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("grousell/obt")
```

## Recode Report Card Marks to Achievement Levels

This functions takes a vector of report card marks and re-codes into
Ontario achievement levels.

``` r
library(obt)
library(dplyr)
df <- ele_rc

df |>
  select (id, reading) |> 
  mutate (reading_level = obt_recode_rc_to_levels(reading))
#> # A tibble: 2,500 x 3
#>        id reading reading_level
#>     <int> <chr>   <chr>        
#>  1 175190 B-      Level 3      
#>  2 280759 R       NE1          
#>  3 379054 C       Level 2      
#>  4 413406 B       Level 3      
#>  5 335653 A-      Level 4      
#>  6 202305 90      Level 4      
#>  7 478795 65      Level 2      
#>  8 477059 C       Level 2      
#>  9 498422 68      Level 2      
#> 10 178066 A       Level 4      
#> # ... with 2,490 more rows
#> # i Use `print(n = ...)` to see more rows
```
