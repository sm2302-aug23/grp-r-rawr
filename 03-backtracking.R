library(tidyverse)

#1: Check if a sequence shows backtracking and apply function

has_backtracking <- function(seq) {
  decreasing <- FALSE
  for (i in 2:length(seq)) {
    if (seq[i] < seq[i-1]) {
      decreasing <- TRUE
    } else if (decreasing && seq[i] > seq[i-1]) {
      return(TRUE)
    }
  }
  return(FALSE)
}

backtracks_df <- collatz_df %>%
  filter(sapply(seq, has_backtracking))

#2: Find the mode backtrack
mode_backtrack <- backtracks_df %>%
  mutate(backtrack_df = sapply(seq, function(x) sum(x > x[1]))) %>%
  summarise(mode_backtrack = as.numeric(names(sort(table(backtrack_df), decreasing = TRUE)[1])))

mode_backtrack <- as.integer(mode_backtrack)

#3: Calculate the maximum value reached after the first backtrack
max_after_backtrack <- backtracks_df %>%
  mutate(max_after_backtrack = sapply(seq, function(x) max(x[x > x[1]]))) %>%
  summarise(max_after_backtrack = max(max_after_backtrack))

max_after_backtrack <- as.integer(max_after_backtrack)

#4: Calculate the frequency counts for even and odd backtracking integers
even_odd_backtrack <- backtracks_df %>%
  summarise(
    Even = sum(start %% 2 == 0),
    Odd = n() - sum(start %% 2 == 0)
  )

even_odd_backtrack$Even
even_odd_backtrack$Odd


