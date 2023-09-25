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
# Code to calculate even_odd_avg_len

# Add the 'even_odd' column to collatz_df during the data wrangling process
collatz_df <- collatz_df %>%
  mutate(even_odd = ifelse(start %% 2 == 0, "Even", "Odd"))

# Now calculate average lengths for even and odd starting integers
even_odd_avg_len <- collatz_df %>%
  group_by(even_odd) %>%
  summarize(avg_len = mean(seq_length, na.rm = TRUE))

# Expected values
expected_avg_len <- c(79.5936, 92.3396)

# Check if the calculated values match the expected values with a tolerance
if(all(abs(even_odd_avg_len$avg_len - expected_avg_len) < 1e-6)) {
  cat("even_odd_avg_len matches expected values.\n")
} else {
  cat("even_odd_avg_len does not match expected values.\n")
}

# Save the result
saveRDS(even_odd_avg_len, file = "even_odd_avg_len.rds")


# Code to calculate even_odd_sd_len
even_odd_sd_len <- collatz_df %>%
  group_by(parity) %>%
  summarize(even_sd_len = sd(as.numeric(seq_length), na.rm = TRUE)) 
  group_by(even_odd) %>%
  summarize(sd_len = mean(seq_length, na.rm = TRUE))

# Expected values
expected_sd_len <- c(45.10308, 47.18387)

# Check if the calculated values match the expected values with a tolerance
if(all(abs(even_odd_sd_len$sd_len - expected_sd_len) < 1e-5)) {
  cat("even_odd_sd_len matches expected values.\n")
} else {
  cat("even_odd_sd_len does not match expected values.\n")
}

# Save the result
saveRDS(even_odd_sd_len, file = "even_odd_sd_len.rds")
