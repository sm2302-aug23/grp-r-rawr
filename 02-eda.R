library(tidyverse)

collatz_df <- collatz_df %>%
  mutate(seq_length = sapply(seq, length))

#1. Find the top 10 starting integers that produce the longest sequences [top10longest]
top10longest <- collatz_df %>%
  mutate(seq_length = lengths(seq)) %>%
  arrange(desc(seq_length)) %>%
  head(10)


#2. Find out which starting integer produces a sequence that reaches the highest maximum value [max_val_int]

max_val_int <- collatz_df %>%
  mutate(max_val = sapply(seq, max)) %>%
  filter(max_val == max(max_val)) %>%
  select(start)


#3. What is the average length and standard deviation of the sequence for even starting integers compared to odd ones? [even_odd_avg_len and even_odd_sd_len]

even_odd_avg_len <- collatz_df %>%
  mutate(start_type = ifelse(start %% 2 == 0, "Even", "Odd")) %>%
  group_by(start_type) %>%
  summarize(avg_length = mean(seq_length))

even_odd_sd_len <- collatz_df %>%
  mutate(start_type = ifelse(start %% 2 == 0, "Even", "Odd")) %>%
  group_by(start_type) %>%
  summarize(sd_length = sd(seq_length))



saveRDS(top10longest, file = "top10longest.rds")
saveRDS(max_val_int, file = "max_val_int.rds")
saveRDS(even_odd_avg_len, file = "even_odd_avg_len.rds")


