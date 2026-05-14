
# typecleanR

**A tidyverse-friendly toolkit for smart type cleaning.**

Helps analysts quickly transform messy real-world columns into reliable `numeric`, `Date`/`POSIXct`, and `logical` formats.

## Installation

```r
# Install from GitHub
devtools::install_github("abiyug/typecleanR")
```

## Quick Start

``` r
library(devtools)
load_all()          # during development
# or after installation: library(typecleanR)

library(dplyr)

# Recommended: one-step cleaning
clean_types(toy_df)
```

## Example

``` r
library(devtools)
load_all()
library(dplyr)

toy_df
```

    ## # A tibble: 5 × 5
    ##   Cost_Basis Sale_date  Flag  Quantity Notes
    ##   <chr>      <chr>      <chr>    <dbl> <chr>
    ## 1 3363.14    05/08/2026 TRUE        18 Alpha
    ## 2 2946.65    5/8/2026   FALSE        7 123  
    ## 3 1971.32    2026-05-08 T            3 Beta 
    ## 4 <NA>       <NA>       F           NA <NA> 
    ## 5 Gain       NotADate   Yes         55 Gamma

``` r
clean_types(toy_df)
```

    ## # A tibble: 5 × 5
    ##   Cost_Basis Sale_date           Flag  Quantity Notes
    ##   <chr>      <dttm>              <lgl>    <dbl> <chr>
    ## 1 3363.14    2026-05-08 00:00:00 TRUE        18 Alpha
    ## 2 2946.65    2026-05-08 00:00:00 FALSE        7 123  
    ## 3 1971.32    2026-05-08 00:00:00 TRUE         3 Beta 
    ## 4 <NA>       NA                  FALSE       NA <NA> 
    ## 5 Gain       NA                  TRUE        55 Gamma

## Main Functions

- **`clean_types(.data)`** — Smart all-in-one cleaner (recommended)
- `as_numeric_if_all(x)` — Only converts if **all** non-NA values look
  numeric
- `as_date_if_all(x, format = "%m/%d/%Y")` — Strict date conversion
- `as_logical_if_all(x)` — Supports TRUE/FALSE/T/F/Yes/No/Y/N
- `as_datetime_lenient(x)` — Forgiving datetime parser

## Philosophy

- Conservative and safe by default  
- Only converts when confident  
- Works great with `dplyr::across()` and pipes  
- Designed for real messy data from Excel, CSVs, etc.

\`\`\`
