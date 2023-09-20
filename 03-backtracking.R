library(tidyverse)

#1: Filter for backtracking sequences
contain_backtracking <- function(seq, start) {
  any(seq < start) && any(seq > start)
}

backtracks_df <- collatz_df %>%
  filter(map2_lgl(seq, start, ~ contain_backtracking(.x, .y)))

#2: Find the mode backtrack (most frequent occuring number of )
backtrack_counts <- backtracks_df %>%
  mutate(
    backtrack_count = sum(seq < start),
    max_after_backtrack = sapply(seq, function(x) max(x[x > start]))
  )

mode_backtrack <- as.integer(names(sort(table(backtrack_counts$backtrack_count), decreasing = TRUE)[1]))

#3: Calculate the maximum value reached after the first backtrack
max_after_backtrack <- max(backtrack_counts$max_after_backtrack)

#4:Calculate the frequency counts for even and odd backtracking integers

