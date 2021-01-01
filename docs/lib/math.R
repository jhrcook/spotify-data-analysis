
cosine_similarity <- function(x, y) {
  ((x %*% y) / (sqrt(sum(x^2)) * sqrt(sum(y^2))))[[1]]
}


scale_numeric <- function(x, na.rm = TRUE) {
  (x - mean(x, na.rm = na.rm)) / sd(x, na.rm = na.rm)
}
