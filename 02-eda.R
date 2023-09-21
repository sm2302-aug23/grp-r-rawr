
#1. Find the top 10 starting integers that produce the longest sequences [top10longest]
collatz_seq <- function(n) {
  seq <- c(n)
  while (n != 1) {
    if (n %% 2 == 0) {
      n <- n / 2
    } else {
      n <- 3*n + 1
    }
    seq <- c(seq, n)
  }
  return(seq)
}

start_int <- 1:100
sequences <- lapply(start_int, collatz_seq)

library(tidyverse)

collatz_df <- tibble(start_int = start_int, seq = sequences)

top10longest <- collatz_df %>%
  mutate(seq_length = map_int(seq, length)) %%
  arrange(desc(seq_length)) %>%
  head(10)

saveRDS(top10longest, file = "top10longest.rds")

#2. Find out which starting integer produces a sequence that reaches the highest maximum value [max_val_int]
collatz_df <- collatz_df %>%
  mutate(max_val = sapply(seq, max))

max_val_int <- collatz_df %>%
  arrange(desc(max_val)) %>%
  head(1) %>%
  select(start) %>%
  pivot_wider(names_from = start, values_from = start)

saveRDS(max_val_int, file = "max_val_int.rds")

#3. What is the average length and standard deviation of the sequence for even starting integers compared to odd ones? [even_odd_avg_len and even_odd_sd_len]
even_odd_avg_len <- collatz_df %>%
  mutate(seq_length = as.numeric(seq_length)) %>%
  group_by(parity) %>%
  summarize(even_odd_avg_len = mean(seq_length, na.rm = TRUE))

even_odd_sd_len <- collatz_df %>%
  mutate(seq_length = as.numeric(seq_length)) %>%
  group_by(parity) %>%
  summarize(even_odd_sd_len = sd(seq_length, na.rm = TRUE))

even_odd_summary <- collatz_df %>%
  group_by(parity) %>%
  summarize(
    even_odd_avg_len = mean(seq_length),
    even_odd_sd_len = sd(seq_length)
  )

saveRDS(even_odd_summary, file = "even_odd_summary.rds")

combined_df <- bind_cols(max_val_int, top10longest)

