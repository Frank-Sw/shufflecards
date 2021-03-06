# shufflecards <img src="man/figures/shufflecards.png" width=200 align="right" />

> Filter and sort grid layouts in Shiny application and Markdown document with [Shuffle.js](https://github.com/Vestride/Shuffle).


[![Travis-CI Build Status](https://travis-ci.org/dreamRs/shufflecards.svg?branch=master)](https://travis-ci.org/dreamRs/shufflecards)
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)


## Installation

You can install `shufflecards` from GitHub:

```r
# with remotes
remotes::install_github("dreamRs/shufflecards")

# or with install-github.me service (based on remotes)
source("https://install-github.me/dreamRs/shufflecards")

# or with devtools:
devtools::install_github("dreamRs/shufflecards")
```

## Example

### Markdown

You can **create** and **arrange** grid layout.

Examples:

* With an `htmlwidget` : https://dreamrs.github.io/tweets-transports/
* With HTML tags : https://dreamrs.github.io/shufflecards

### Shiny

You can **create**, **arrange** and **filter** grid layout.

Examples:

![](imgs/shufflecards-play.gif)

(You can replace cards by plots or whatever you want :) )

To run app above:
```r
shufflecards::play()
```

With data from `gapminder` package and `ggplot2`:

![](imgs/shufflecards-gapminder.gif)


