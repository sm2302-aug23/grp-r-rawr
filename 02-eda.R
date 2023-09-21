
#1. Find the top 10 starting integers that produce the longest sequences [top10longest]
collatz_seq <- function(n) {
  sequence <- c(n)
  while (n != 1) {
    if (n %% 2 == 0) {
      n <- n / 2
    } else {
      n <- 3*n + 1
    }
    seq <- c(sequence, n)
  }
  return(sequence)
}

start_int <- 1:100
sequences <- lapply(start_int, collatz_seq)

library(tidyverse)

collatz_df <- tibble(start_int = start_int, sequence = sequences)

top10longest <- collatz_df %>%
  mutate(sequence_length = map_int(sequence, length)) %%
  arrange(desc(sequence_length)) %>%
  slice_head(n =10)

saveRDS(top10longest, file = "top10longest.rds")

#2. Find out which starting integer produces a sequence that reaches the highest maximum value [max_val_int]
max_val_int <- collatz_df %>%
  mutate(max_val = map_dbl(sequence, max)) %>%
  filter(max_val == max(max_val)) %>%
  
saveRDS(max_val_int, file = "max_val_int.rds")

#3. What is the average length and standard deviation of the sequence for even starting integers compared to odd ones? [even_odd_avg_len and even_odd_sd_len]
even_odd_avg_len <- collatz_df %>%
  mutate(is_even = start_int %% 2 == 0) %>%
  group_by(is_even) %>%
  summarize(avg_length = mean(map_dbl(sequence, ~length(.))))

even_odd_sd_len <- collatz_df %>%
  mutate(is_even = start_int %% 2 == 0) %>%
  group_by(is_even) %>%
  summarize(sd_length = sd(map_dbl(sequence, ~length(.))))


saveRDS(even_odd_avg_len, file = "even_odd_avg_len.rds")

saveRDS(even_odd_sd_len, file = "even_odd_sd_len.rds")

combined_df <- bind_cols(max_val_int, top10longest)

