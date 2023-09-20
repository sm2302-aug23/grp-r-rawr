library(tidyverse)

collatz_df <- collatz_df %>%
  mutate(seq_length = sapply(seq, length))

#1. Find the top 10 starting integers that produce the longest sequences [top10longest]
top10longest <- collatz_df %>%
  arrange(desc(seq_length)) %>%
  head(10)

#2. Find out which starting integer produces a sequence that reaches the highest maximum value [max_val_int]
max_val_int <- collatz_df %>%
  mutate(max_val = sapply(seq, max)) %>%
  filter(max_val == max(max_val)) %>%

#3. What is the average length and standard deviation of the sequence for even starting integers compared to odd ones? [even_odd_avg_len and even_odd_sd_len]
even_odd_stats <- collatz_df %>%
  mutate(start_type = ifelse(start %% 2 == 0, "even", "odd"))

even_odd_summary <- collatz_df %>%
  mutate(is_even = start %% 2 == 0) %>%
  group_by(is_even) %>%
  summarize(
    even_odd_avg_len = mean(seq_length),
    even_odd_sd_len = sd(seq_length)
  )

saveRDS(top10longest, file = "top10longest.rds")
saveRDS(max_val_int, file = "max_val_int.rds")
saveRDS(even_odd_summary, file = "even_odd_summary.rds")

