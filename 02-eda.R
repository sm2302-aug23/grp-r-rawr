library(dplyr)

collatz_df <- collatz_df %>%
  mutate(seq_length = sapply(seq, length))

#1 Find top 10 longest sequences
top10longest <- collatz_df %>%
  arrange(collatz_df = seq, desc(seq_length)) %>%
  head(10)

print(top10longest)
