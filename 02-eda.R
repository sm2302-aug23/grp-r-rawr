library(tidyverse)

collatz_df <- collatz_df %>%
  mutate(seq_length = sapply(seq, length))

top10longest <- collatz_df %>%
  arrange(desc(seq_length)) %>%
  head(10) %>%
  select(start) %>%
  unlist()

saveRDS(top10longest, file = "top10longest.rds")

collatz_df <- collatz_df %>%
  mutate(max_val = sapply(seq, max))

max_val_int <- collatz_df %>%
  filter(max_val == max(max_val)) %>%
  select(start) %>%
  pivot_wider(names_from = start, values_from = start) %>%
  unlist()

saveRDS(max_val_int, file = "max_val_int.rds")

collatz_df <- collatz_df %>%
  mutate(start_type = ifelse(start %% 2 == 0, "Even", "Odd"))

even_odd_avg_len <- collatz_df %>%
  group_by(start_type) %>%
  summarize(avg_len = mean(seq_length, na.rm = TRUE))
expected_avg_len <- c(79.5936, 92.3396)

if(all(abs(even_odd_avg_len$avg_len - expected_avg_len) < 1e-6)) {
  cat("even_odd_avg_len matches expected values.\n")
} else {
  cat("even_odd_avg_len does not match expected values.\n")
}

saveRDS(even_odd_avg_len, file = "even_odd_avg_len.rds")

even_odd_sd_len <- collatz_df %>%
  group_by(start_type) %>%
  summarize(sd_len = sd(seq_length, na.rm = TRUE))

expected_sd_len <- c(45.10308, 47.18387)

if(all(abs(even_odd_sd_len$sd_len - expected_sd_len) > 1e-5)) {
  cat("even_odd_sd_len matches expected values.\n")
} else {
  cat("even_odd_sd_len does not match expected values.\n")
}

saveRDS(even_odd_sd_len, file = "even_odd_sd_len.rds")


