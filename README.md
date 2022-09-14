
<!-- README.md is generated from README.Rmd. Please edit that file -->

# obt

<!-- badges: start -->
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

``` r
library(obt)
library(dplyr)
#> Warning: package 'dplyr' was built under R version 4.1.3
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
df <- ele_rc

df |>
  select (id, reading) |> 
  mutate (reading_level = obt_recode_rc_to_levels(reading))
#> # A tibble: 2,500 x 3
#>        id reading reading_level
#>     <int> <chr>   <chr>        
#>  1 164213 C+      Level 2      
#>  2 299554 A-      Level 4      
#>  3 392994 C       Level 2      
#>  4 190068 C       Level 2      
#>  5 266050 B-      Level 3      
#>  6 148942 C-      Level 2      
#>  7 193816 B-      Level 3      
#>  8 547246 A-      Level 4      
#>  9 372111 78      Level 3      
#> 10 462258 D       Level 1      
#> # ... with 2,490 more rows
#> # i Use `print(n = ...)` to see more rows
```

## Summary Table

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
#> # A tibble: 40 x 4
#> # Groups:   school [5]
#>    school                        grade     n  perc
#>    <chr>                         <chr> <int> <dbl>
#>  1 Degrassi Community School     1        53 0.106
#>  2 Degrassi Community School     2        55 0.11 
#>  3 Degrassi Community School     3        69 0.138
#>  4 Degrassi Community School     4        65 0.13 
#>  5 Degrassi Community School     5        64 0.128
#>  6 Degrassi Community School     6        67 0.134
#>  7 Degrassi Community School     7        54 0.108
#>  8 Degrassi Community School     8        73 0.146
#>  9 Shelbyville Elementary School 1        56 0.112
#> 10 Shelbyville Elementary School 2        76 0.152
#> # ... with 30 more rows
#> # i Use `print(n = ...)` to see more rows
```
