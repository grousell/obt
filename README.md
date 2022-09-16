
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
#>  1 310535 R       NE1          
#>  2 324271 R       NE1          
#>  3 394022 52      Level 1      
#>  4 482099 A-      Level 4      
#>  5 274236 D       Level 1      
#>  6 271998 B-      Level 3      
#>  7 424555 C+      Level 2      
#>  8 314324 B-      Level 3      
#>  9 281326 R       NE1          
#> 10 318039 B-      Level 3      
#> # ... with 2,490 more rows
#> # i Use `print(n = ...)` to see more rows
```

## Summary Table

This function provides a summary table of counts and percentages for
either a single variable, or a grouped variable. This table can then be
used directly with `ggplot2` for visualisations.

``` r
library(obt)

df <- ele_rc

df |> 
  obt_summary_table(school)
#> # A tibble: 5 x 3
#>   school                            n  perc
#>   <chr>                         <int> <dbl>
#> 1 Degrassi Community School       500   0.2
#> 2 Shelbyville Elementary School   500   0.2
#> 3 Southpark Elementary School     500   0.2
#> 4 Springfield Elementary School   500   0.2
#> 5 Watkins Middle School           500   0.2
```

## Grouped Summary Table

``` r
library(obt)

df <- ele_rc

df |> 
  obt_summary_table(school, grade)
#> # A tibble: 41 x 4
#> # Groups:   school [5]
#>    school                        grade     n  perc
#>    <chr>                         <chr> <int> <dbl>
#>  1 Degrassi Community School     1        54 0.108
#>  2 Degrassi Community School     2        65 0.13 
#>  3 Degrassi Community School     3        56 0.112
#>  4 Degrassi Community School     4        59 0.118
#>  5 Degrassi Community School     5        65 0.13 
#>  6 Degrassi Community School     6        54 0.108
#>  7 Degrassi Community School     7        65 0.13 
#>  8 Degrassi Community School     8        82 0.164
#>  9 Shelbyville Elementary School 1        71 0.142
#> 10 Shelbyville Elementary School 2        59 0.118
#> # ... with 31 more rows
#> # i Use `print(n = ...)` to see more rows
```
