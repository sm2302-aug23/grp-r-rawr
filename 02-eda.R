library(tidyverse)

#1. Find the top 10 starting integers that produce the longest sequences [top10longest]
collatz_df <- collatz_df %>%
  mutate(seq_length = sapply(seq, length))

top10longest <- collatz_df %>%
  arrange(desc(seq_length)) %>%
  head(10) %>%
  select(start) %>%
  unlist()

saveRDS(top10longest, file = "top10longest.rds")

#2. Find out which starting integer produces a sequence that reaches the highest maximum value [max_val_int]
collatz_df <- collatz_df %>%
  mutate(max_val = sapply(seq, max))

max_val_int <- collatz_df %>%
  filter(max_val == max(max_val)) %>%
  select(start) %>%
  pivot_wider(names_from = start, values_from = start) %>%
  unlist()

saveRDS(max_val_int, file = "max_val_int.rds")

#3. Average length and standard deviation of the sequence for even starting integers compared to odd ones
even_odd_avg_len <- collatz_df %>%
  group_by(parity) %>%
  summarize(avg_len = mean(as.numeric(seq_length), na.rm = TRUE)) %>%
  as.data.frame() 

saveRDS(even_odd_avg_len, file = "even_odd_avg_len.rds")

even_odd_sd_len <- collatz_df %>%
  group_by(parity) %>%
  summarize(sd_len = sd(as.numeric(seq_length), na.rm = TRUE)) %>%
  as.data.frame()

saveRDS(even_odd_sd_len, file = "even_odd_sd_len.rds")


