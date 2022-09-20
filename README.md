
<!-- README.md is generated from README.Rmd. Please edit that file -->

# obt

<!-- badges: start -->

[![R-CMD-check](https://github.com/grousell/obt/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/grousell/obt/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of the Ontario Board Tools `obt` package is to provide tools
for data professionals in Ontario school boards (and elsewhere) to work
with common data sets across the province. This includes:

-   Report Card Data (elementary and secondary)  
-   EQAO Data (Primary and Junior assessments of Reading, Writing and
    Mathematics, Grade 9 Assessments of Mathematics and the Ontario
    Secondary School Literacy Test) (pending)  
-   Ontario University Application Center (OUAC) and Ontario College
    Application Service (OCAS) data (pending)

Features of this package include re-coding report card marks to

-   Ontario achievement levels  
-   At/Above Standard (e.e Level 3 or Level 4)  
-   Pass/Fail  
-   Alpha marks to numeric equivalent (i.e. A = 90, B- = 72, D = 55)

## Installation

You can install the development version of `obt` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("grousell/obt")
```
