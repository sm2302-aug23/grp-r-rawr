library(tidyverse)

#1: Filter for backtracking sequences
backtracks_df <- collatz_df %>%
  filter(sapply(seq, function(x) any(x > x[1])))

#2: Find the mode backtrack
mode_backtrack <- backtracks_df %>%
  mutate(backtrack_df = sapply(seq, function(x) sum(x > x[1]))) %>%
  group_by(parity) %>%
  summarise(mode_backtrack = as.numeric(names(sort(table(backtrack_df), decreasing = TRUE)[1])))

#3: Calculate the maximum value reached after the first backtrack
max_after_backtrack <- backtracks_df %>%
  rowwise() %>%
  mutate(first_backtrack_index = which(seq < start)[1],
         max_after_backtrack = max(seq[(first_backtrack_index + 1):length(seq)])) %>%
  select(max_after_backtrack) %>%
  unlist()

#4: Calculate the frequency counts for even and odd backtracking integers
even_odd_backtrack <- backtracks_df %>%
  summarise(
    Even = sum(start %% 2 == 0),
    Odd = n() - sum(start %% 2 == 0)
  )

even_odd_backtrack$Even
even_odd_backtrack$Odd




