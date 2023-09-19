library(tidyverse)

collatz_df <- collatz_df %>%
  mutate(seq_length = sapply(seq, length))

#1. Find the top 10 starting integers that produce the longest sequences [top10longest]
top10longest <- collatz_df %>%
  arrange(desc(length)) %>%
  top_n(10, seq_length)

#2. Find out which starting integer produces a sequence that reaches the highest maximum value [max_val_int]

max_val_int <- collatz_df %>%
  filter(max_val == max(max_val)) %>%
  select(start, max_val)


#3. What is the average length and standard deviation of the sequence for even starting integers compared to odd ones? [even_odd_avg_len and even_odd_sd_len]

even_odd_avg_len <- collatz_df %>%
  group_by(parity) %>%
  summarize(avg_length = mean(length, na.rm = TRUE), sd_length = sd(length, na.rm = TRUE))



saveRDS(top10longest, file = "top10longest.rds")
saveRDS(max_val_int, file = "max_val_int.rds")
saveRDS(even_odd_avg_len, file = "even_odd_avg_len.rds")



