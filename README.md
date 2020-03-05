
<!-- README.md is generated from README.Rmd. Please edit that file -->

# corona19

The goal of corona19 is to get datasets of Coronavirus disease 2019 in
South Korea from [Coronavirus-Dataset
repository](https://github.com/jihoo-kim/Coronavirus-Dataset).

## Installation

You can install the developing version of corona19 from
[github](https://github.com/youngwoos/corona19) with:

``` r
# install.packages("remotes")
remotes::install_github("youngwoos/corona19")
```

## Example

``` r
library(corona19)
state <- getdata("state")
state
#> # A tibble: 45 x 11
#>    date       acc_test acc_negative acc_confirmed acc_released acc_deceased
#>    <date>        <int>        <int>         <int>        <int>        <int>
#>  1 2020-01-20        1            0             1            0            0
#>  2 2020-01-21        1            0             1            0            0
#>  3 2020-01-22        4            3             1            0            0
#>  4 2020-01-23       22           21             1            0            0
#>  5 2020-01-24       27           25             2            0            0
#>  6 2020-01-25       27           25             2            0            0
#>  7 2020-01-26       51           47             3            0            0
#>  8 2020-01-27       61           56             4            0            0
#>  9 2020-01-28      116           97             4            0            0
#> 10 2020-01-29      187          155             4            0            0
#> # … with 35 more rows, and 5 more variables: new_test <int>,
#> #   new_negative <int>, new_confirmed <int>, new_released <int>,
#> #   new_deceased <int>

library(ggplot2)
ggplot(data = state, aes(x = date, y = acc_confirmed)) + 
  geom_area(color="darkblue", fill="lightblue") + 
  scale_x_date(date_breaks = "weeks" , date_labels = "%m-%d")
```

<img src="man/figures/README-example-1.png" width="100%" />
