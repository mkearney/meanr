% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/score.r
\name{score}
\alias{score}
\alias{score_score}
\title{score}
\usage{
score(s, nthreads = NULL)

score_score(s, nthreads = NULL)
}
\arguments{
\item{s}{A string or vector of strings.}

\item{nthreads}{Number of threads to use. By default it will use the total
number of cores + hyperthreads.}
}
\value{
A dataframe, consisting of columns "positive", "negative", "score", and "wc".
With the exception of "score", these are counts; that is, "positive" is the
number of positive sentiment words, "negative" is the number of negative
sentiment words, and "wc" is the wordcount (total number of words).
}
\description{
Computes score via the sum of the total number of positive and
negative scored words. The function is vectorized so that it will return one
row per string. The scoring function ignores (upper/lower) case and
punctuation.
}
\details{
The scoring function uses OpenMP to process text in parallel.
}
\examples{
library(meanrtemplate)
s1 = "Abundance abundant accessable."
s2 = "Banana apple orange."
s3 = "Abnormal abolish abominable."
s = c(s1, s2, s3)

# as separate 'documents'
score(s, nthreads = 1)

# as one document
score(paste0(s, collapse=" "), nthreads = 1)

}
\references{
Hu, M., & Liu, B. (2004). Mining opinion features in customer
reviews. National Conference on Artificial Intelligence.
}
