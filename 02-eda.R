library(tidyverse)

#1. Find the top 10 starting integers that produce the longest sequences [top10longest]
top10longest <- collatz_df %>%
  arrange(desc(length)) %>%
  top_n(10, seq_length)



