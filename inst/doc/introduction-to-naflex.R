## ----eval = FALSE-------------------------------------------------------------
#  install.packages("naflex")

## ----eval = FALSE-------------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("dannyparsons/naflex")

## -----------------------------------------------------------------------------
library(naflex)

x <- c(1, 3, NA, NA, 3, 2, NA, 5, 8, 7)

# Calculate if 30% or less missing values
mean(na_omit_if(x, prop = 0.3))
# Calculate if 20% or less missing values
mean(na_omit_if(x, prop = 0.2))

## -----------------------------------------------------------------------------
# Calculate if 4 or less missing values and 1 or less consecutive missing values 
mean(na_omit_if(x, n = 4, consec = 1))

## ---- warning = FALSE---------------------------------------------------------
require(magrittr)

sum(x %>% na_omit_if(prop = 0.25))

## -----------------------------------------------------------------------------
# Missing values removed
na_omit_if(x, n = 4)

## -----------------------------------------------------------------------------
# Missing values not removed, x is unmodified
na_omit_if(x, n = 2)

## -----------------------------------------------------------------------------
if (na_check(x, n = 4, consec = 1)) "NA checks pass" else "NA checks fail"

## -----------------------------------------------------------------------------
na_prop(x)
na_n(x)
na_consec(x)
na_non_na(x)

## -----------------------------------------------------------------------------
mean(na_omit_if(x, n = 4, prop = 0.2))

## -----------------------------------------------------------------------------
ifelse(sum(is.na(x)) <= 4 && mean(is.na(x)) <= 0.2, mean(x, na.rm = TRUE), NA)

## -----------------------------------------------------------------------------
mean(na_omit_if(x, consec = 5))

## -----------------------------------------------------------------------------
r <- rle(is.na(x))
m <- r$lengths[r$values]
ifelse(max(m) <= 5, mean(x, na.rm = TRUE), NA)

