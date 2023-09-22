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

#3. What is the average length and standard deviation of the sequence for even starting integers compared to odd ones? [even_odd_avg_len and even_odd_sd_len]
even_avg_len <- collatz_df %>%
  filter(parity == "even") %>%
  summarize(even_avg_len = mean(seq_length, na.rm = TRUE))

odd_avg_len <- collatz_df %>%
  filter(parity == "odd") %>%
  summarize(odd_avg_len = mean(seq_length, na.rm = TRUE))

even_odd_avg_len <- c(even_avg_len$even_avg_len, odd_avg_len$odd_avg_len)

expected_avg_len <- c(1.160139, 1)

if (all(!is.na(even_odd_avg_len)) && all(abs(even_odd_avg_len - expected_avg_len) < 1e-6)) {
  stop("Ratios of even_avg_len to odd_avg_len do not match the expected values.")
}

saveRDS(even_odd_avg_len, file = "even_odd_avg_len.rds")

even_sd_len <- collatz_df %>%
  filter(parity == "even") %>%
  summarize(even_sd_len = sd(seq_length, na.rm = TRUE))

odd_sd_len <- collatz_df %>%
  filter(parity == "odd") %>%
  summarize(odd_sd_len = sd(seq_length, na.rm = TRUE))

even_odd_sd_len <- c(even_sd_len$even_sd_len, odd_sd_len$odd_sd_len)

expected_sd_len <- c(1.046134, 1)

if (any(is.nan(even_odd_sd_len))) {
  stop("Ratios of even_sd_len to odd_sd_len contain NaN values.")
}

if (all(!is.na(even_odd_sd_len)) && all(abs(even_odd_sd_len - expected_sd_len) < 1e-6)) {
  stop("Ratios of even_sd_len to odd_sd_len do not match the expected values.")
}

saveRDS(even_odd_sd_len, file = "even_odd_sd_len.rds")