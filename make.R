txt <- c("love amazing excellent good",
  "hate loathe horrifies unhappy terrible",
  "awesome best hateful hated worst")


## vector of positive words
pos <- c("like", "love", "amazing", "excellent", "great", "fantastic",
  "incredible", "awesome", "best", "favorite", "fan", "fun", "enjoyed",
  "enjoyed", "good", "solid", "better", "soooo", "happy")

## vetor of negative words
neg <- c("hate", "loathe", "dislike", "awful", "horrible", "worst",
  "miserable", "ruin", "ruining", "destroy", "destroyed", "destroying",
  "pathetic", "hated", "hateful", "unhappy", "horrifies", "horrifying",
  "terrible")


write_pos_neg <- function(pos, neg = NULL) {
  writeLines(unique(enc2utf8(pos)), "src/hashtable/maker/positive.txt")
  if (is.null(neg)) {
    neg <- "zcxpoi"
  }
  writeLines(unique(enc2utf8(neg)), "src/hashtable/maker/negative.txt")
  setwd(here::here("src", "hashtable", "maker"))

  ## create words file
  system("./makewords.sh")

  ## create hash files
  system("./make2tables.sh")

  ## change size_t to pointer
  x <- tfse::readlines("neghash.h")
  x <- sub("int\\)\\(size_t", "intptr_t", x)
  writeLines(x, "neghash.h")
  x <- tfse::readlines("poshash.h")
  x <- sub("int\\)\\(size_t", "intptr_t", x)
  writeLines(x, "poshash.h")

  ## move hash files
  if (file.exists("../neghash.h"))
    file.remove("../neghash.h")
  if (file.exists("../poshash.h"))
    file.remove("../poshash.h")
  file.copy("poshash.h", "../")
  file.copy("neghash.h", "../")
  file.remove("neghash.h")
  file.remove("poshash.h")

  ## return working directory
  setwd(here::here())
}

