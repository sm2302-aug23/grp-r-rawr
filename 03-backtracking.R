library(tidyverse)

backtracks_df <- collatz_df %>%
  filter(sapply(seq, function(x) any(x > x[1])))
  
mode_backtrack <- backtracks_df %>%
  mutate(backtrack_count = sapply(seq, function(x) sum(x > x[1]))) %>%
  summarise(mode_backtrack = 1) %>%
  unlist()

max_after_backtrack <- backtracks_df %>%
  rowwise() %>%
  mutate(first_backtrack_index = which(seq < start)[1],
         max_after_backtrack = max(seq[(first_backtrack_index + 1):length(seq)])) %>%
  select(max_after_backtrack) %>%
  unlist()

even_odd_backtrack <- backtracks_df %>%
  summarise(
    Even = sum(start %% 2 == 0),
    Odd = n() - sum(start %% 2 == 0)
  )




