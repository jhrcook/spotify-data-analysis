
display_head <- function(df, n = 5, ...) {
  df %>%
    head(n = n) %>%
    kableExtra::kbl() %>%
    kableExtra::kable_styling(bootstrap_options = c("striped", "hover"), ...)
}
