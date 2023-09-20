library(tidyverse)

contains_backtracking <- function(seq, start) {
  first_backtrack <- min(which(seq < start))
  max_after_backtrack <- max(seq[first_backtrack + 1:length(seq)])
  return(first_backtrack < length(seq) && max_after_backtrack > start)
}

#1: Filter for backtracking sequences
backtracks_df <- collatz_df %>%
  filter(map2_lgl(seq, start, ~ contains_backtracking(.x, .y)))

#2: Find the mode backtrack
backtracks_df <- backtracks_df %>%
  mutate(
    backtrack_count = map_int(seq, ~ sum(.x > start)),
    max_after_backtrack = map_dbl(seq, ~ max(.x[.x > start]))
  )

mode_backtrack <- as.integer(names(sort(table(backtracks_df$backtrack_count), decreasing = TRUE)[1]))

#4: Calculate the maximum value reached after the first backtrack
max_after_backtrack <- max(backtracks_df$max_after_backtrack)

#5: Calculate the frequency counts for even and odd backtracking integers
even_odd_backtrack <- backtracks_df %>%
  group_by(parity) %>%
  summarize(count = n())


head(backtracks_df)
mode_backtrack
max_after_backtrack
even_odd_backtrack
