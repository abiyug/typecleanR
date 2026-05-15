# typecleanR

**typecleanR** is a tidyverse‑friendly toolkit for safely coercing messy columns into consistent numeric, date, logical, and datetime formats. It’s designed for reproducible analytics and preparing prompts for **LLM orchestration** reducing hallucinations and strengthening guardrails with a golden enriched dataset.

Helps analysts quickly transform messy real-world columns into reliable `numeric`, `Date`/`POSIXct`, and `logical` formats — **safely and predictably**.

![R](https://img.shields.io/badge/R-276DC3?logo=r&logoColor=white)
[![GitHub](https://img.shields.io/badge/GitHub-abiyug/typecleanR-blue?logo=github)](https://github.com/abiyug/typecleanR)

## Getting Started

The package ships with a built‑in dataset toy_data that mimics real‑world quirks: numbers stored as text, dates in mixed formats, and logical flags in inconsistent forms.

```r
# Install the package
devtools::install_github("abiyug/typecleanR")

library(typecleanR)
library(dplyr)

# One-line cleaning
clean_types(toy_df)
```

## 📊 Example

```{r}
toy_df
```

**After `clean_types(toy_df)`:**

- `Cost_Basis` → stays character (contains "Gain")
- `Sale_date` → `POSIXct`
- `Flag` → `logical`
- `Quantity` → stays numeric

## 📖 Learn More

For a deeper dive, check out the vignette:  
👉 **[→ Read the full Getting Started Vignette](https://github.com/abiyug/typecleanR/blob/main/doc/typecleanR.html)**  
*(highly recommended — includes detailed examples and workflows)*

Or open it directly from R:

```r
# Browse the vignette in your browser (after building docs)
browseURL("doc/typecleanR.html")

# Or open via R's vignette system
vignette("typecleanR", package = "typecleanR")
```

The vignette walks through the **problem**, shows **one‑step cleaning**, explains **what changed**, and demonstrates **individual functions** and **typical workflows**.



## Main Functions

| Function                    | Description                                      | Use Case                     |
|----------------------------|--------------------------------------------------|------------------------------|
| `clean_types()`            | All-in-one smart cleaner (recommended)           | Most common                  |
| `as_numeric_if_all()`      | Safe numeric conversion                          | Financial / measurement data |
| `as_date_if_all()`         | Strict date conversion                           | Known date formats           |
| `as_logical_if_all()`      | Flexible logical (Yes/No/T/F etc.)               | Flags & indicators           |
| `as_datetime_lenient()`    | Forgiving datetime parser                        | Very messy dates             |

## Philosophy

- **Conservative by default** — never converts unless very confident
- Works beautifully with `dplyr::across()` and pipes
- Built for real messy data coming from Excel, CSVs, surveys, etc.

---
