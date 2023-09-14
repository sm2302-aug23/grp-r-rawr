library(dplyr)

collatz_df <- collatz_df %>%
  mutate(seq_length = sapply(seq, length))

#1 Find top 10 longest sequences
top10longest <- collatz_df %>%
  arrange(desc(seq_length)) %>%
  head(10)

#2 Find the row where the maximum value in the sequence is achieved
max_val_int <- collatz_df %>%
  mutate(max_value = sapply(seq, max)) %>%
  filter(max_value == max(max_value))


#3 Separate even and odd starting integers
even_odd_stats <- collatz_df %>%
  mutate(start_type = ifelse(start %% 2 == 0, "even", "odd"))

print(even_odd_stats)

# Calculate average length and standard deviation for even and odd starting integers
even_odd_stats_summary <- even_odd_stats %>%
  group_by(start_type = "even") %>%
  summarize(avg_len = mean(seq_length), sd_len = sd(seq_length))

# Extract the values for even and odd
even_odd_avg_len <- even_odd_stats_summary$avg_len
even_odd_sd_len <- even_odd_stats_summary$sd_len

print(even_odd_stats_summary)
print(even_odd_stats)
print(even_odd_avg_len)
