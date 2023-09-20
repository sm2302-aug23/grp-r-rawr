library(tidyverse)

#1. Find the top 10 starting integers that produce the longest sequences [top10longest]
collatz_df <- collatz_df %>%
  mutate(seq_length = sapply(seq, length))

top10longest <- collatz_df %>%
  arrange(desc(seq_length)) %>%
  head(10)

top10longest <- top10longest %>%
  select(start) %>%
  pivot_wider(names_from = start, values_from = start)

saveRDS(top10longest, file = "top10longest.rds")

#2. Find out which starting integer produces a sequence that reaches the highest maximum value [max_val_int]
collatz_df <- collatz_df %>%
  mutate(max_val = sapply(seq, max))

max_val_int <- collatz_df %>%
  arrange(desc(max_val)) %>%
  head(1) %>%
  select(start) %>%
  pivot_wider(names_from = start, values_from = start)

max_val_int <- collatz_df %>%
  group_by(start) %>%
  summarise(max_val = max(start)) %>%
  top_n(1, wt = max_val)

saveRDS(max_val_int, file = "max_val_int.rds")

#3. What is the average length and standard deviation of the sequence for even starting integers compared to odd ones? [even_odd_avg_len and even_odd_sd_len]
even_odd_avg_len <- collatz_df %>%
  group_by(parity) %>%
  summarize(even_odd_avg_len = mean(length))

even_odd_sd_len <- collatz_df %>%
  group_by(parity) %>%
  summarize(even_odd_sd_len = sd(length))
 
even_odd_summary <- collatz_df %>%
  group_by(parity) %>%
  summarize(
    even_odd_avg_len = mean(length),
    even_odd_sd_len = sd(length)
  )

saveRDS(even_odd_summary, file = "even_odd_summary.rds")
