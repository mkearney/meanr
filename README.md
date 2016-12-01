# meanr

* **Version:** 0.1-0
* **Status:** [![Build Status](https://travis-ci.org/wrathematics/meanr.png)](https://travis-ci.org/wrathematics/meanr)
* **License:** [![License](http://img.shields.io/badge/license-BSD%202--Clause-orange.svg?style=flat)](http://opensource.org/licenses/BSD-2-Clause)
* **Author:** Drew Schmidt


**meanr** is an R package performing basic sentiment analysis.  Its main main method, `score()`, computes sentiment as a simple average.  More sophisticated techniques are available to R, for example in the **qdap** package's `polarity()` function.  The package uses [the Hu and Liu sentiment dictionary](https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html), same as everybody else.

**meanr** is significantly faster than everything else I tried (which was actually the motivation for its creation), but I don't claim to have tried everything.  There are also many opportunities for optimization in this implementation, but so far it's fast enough for my purposes that I'm not yet interested.



## Installation

<!-- You can install the stable version from CRAN using the usual `install.packages()`:

```r
install.packages("meanr")
``` -->

The development version is maintained on GitHub, and can easily be installed by any of the packages that offer installations from GitHub:

```r
### Pick your preference
devtools::install_github("wrathematics/meanr")
ghit::install_github("wrathematics/meanr")
remotes::install_github("wrathematics/meanr")
```



## Example Usage

I have a dataset that, for legal reasons, I can not describe, much less provide.  You can think of them like tweets (they are not tweets).  But take my word for it that it's real, English language text.  The data is in the form of a vector of strings, which we'll call `x`.

```r
x = readRDS("x.rds")

length(x)
## [1] 655760

sum(nchar(x))
## [1] 162663972

library(meanr)
system.time(s <- score(x))
##  user  system elapsed 
## 2.076   0.004   2.081 

head(s)
##   positive negative        avg  wc
## 1        2        0 0.06250000  32
## 2        5        0 0.17241379  29
## 3        4        2 0.02985075  67
## 4       12        3 0.04433498 203
## 5        8        2 0.06000000 100
## 6        4        3 0.01020408  98
```
