# typecleanR
[![R-CMD-check](https://github.com/abiyug/typecleanR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/abiyug/typecleanR/actions/workflows/R-CMD-check.yaml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CRAN status](https://www.r-pkg.org/badges/version/typecleanR)](https://CRAN.R-project.org/package=typecleanR)
[![Downloads](https://cranlogs.r-pkg.org/badges/grand-total/typecleanR)](https://CRAN.R-project.org/package=typecleanR)


**typecleanR** is a tidyverse‑friendly toolkit for safely coercing messy columns into consistent numeric, date, logical, and datetime formats. It’s designed for reproducible analytics and preparing prompts for **LLM orchestration** reducing hallucinations and strengthening guardrails with a golden enriched dataset.

Helps analysts quickly transform messy real-world columns into reliable `numeric`, `Date`/`POSIXct`, and `logical` formats — **safely and predictably**.

![R](https://img.shields.io/badge/R-276DC3?logo=r&logoColor=white)
[![GitHub](https://img.shields.io/badge/GitHub-abiyug/typecleanR-blue?logo=github)](https://github.com/abiyug/typecleanR)

Helps analysts quickly transform messy real-world columns into reliable `numeric`, `Date`/`POSIXct`, and `logical` formats — safely and predictably.

## Installation

```r
devtools::install_github("abiyug/typecleanR")
```

## Getting Start
The package ships with a built‑in dataset toy_data that mimics real‑world quirks: numbers stored as text, dates in mixed formats, and logical flags in inconsistent forms.
```r
library(typecleanR)
library(dplyr)

# One-step cleaning
clean_types(toy_df)
```

## Viewing the Vignette

After installing the package, you can read the full **Getting Started** guide with examples:

```r
# Open the vignette in your browser
vignette("typecleanR", package = "typecleanR")
```

Or browse the vignette directly on GitHub:  
**[Getting Started Vignette](https://github.com/abiyug/typecleanR/blob/master/inst/doc/typecleanR.html)**

## Example

```{r}
toy_df
```

**After `clean_types(toy_df)`:**

- `Cost_Basis` → stays character (contains "Gain")
- `Sale_date` → `POSIXct`
- `Flag` → `logical`
- `Quantity` → stays numeric


## Main Functions

| Function                    | Description                                      | Best For                     |
|----------------------------|--------------------------------------------------|------------------------------|
| `clean_types()`            | All-in-one smart cleaner (recommended)           | Everyday use                 |
| `as_numeric_if_all()`      | Safe numeric conversion                          | Numbers with text mixed in   |
| `as_date_if_all()`         | Strict date conversion                           | Known date formats           |
| `as_logical_if_all()`      | Flexible logical conversion                      | Yes/No, T/F, True/False      |
| `as_datetime_lenient()`    | Forgiving datetime parser                        | Messy dates                  |

>  Coming soon: additional helpers for factors, categorical variables, and text normalization.

## Philosophy

- Conservative by default — only converts when confident
- Works great inside `dplyr` pipelines
- Designed for real messy data from Excel, CSVs, surveys, etc.

