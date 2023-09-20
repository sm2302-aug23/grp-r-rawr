library(tidyverse)

#1. Find the top 10 starting integers that produce the longest sequences [top10longest]
collatz_df <- collatz_df %>%
  mutate(seq_length = sapply(seq, length))

top10longest <- collatz_df %>%
  arrange(desc(collatz_df$seq_length)) %>%
  head(10)

top10longest <- as.data.frame(t(top10longest))
saveRDS(top10longest, file = "top10longest.rds")

#2. Find out which starting integer produces a sequence that reaches the highest maximum value [max_val_int]
collatz_df <- collatz_df %>%
  mutate(max_val = sapply(seq, max))

max_val_int <- collatz_df %>%
  filter(max_val == max(collatz_df$max_val))

max_val_int <- as.data.frame(t(max_val_int))

saveRDS(max_val_int, file = "max_val_int.rds")


#3. What is the average length and standard deviation of the sequence for even starting integers compared to odd ones? [even_odd_avg_len and even_odd_sd_len]
even_odd_summary <- collatz_df %>%
  group_by(parity) %>%
  summarize(
    even_odd_avg_len = mean(collatz_df$length),
    even_odd_sd_len = sd(collatz_df$length)
  )

saveRDS(even_odd_summary, file = "even_odd_summary.rds")
