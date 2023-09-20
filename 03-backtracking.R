library(tidyverse)

#1: Filter for backtracking sequences
backtracks_df <- collatz_df %>%
  filter(sapply(seq, function(x) any(x > x[1])))

#2: Find the mode backtrack
mode_backtrack <- backtracks_df %>%
  mutate(backtrack_count = sapply(seq, function(x) sum(x > x[1]))) %>%
  summarise(mode_backtrack = as.numeric(names(sort(table(backtrack_count), decreasing = TRUE)[1])))

#3: Calculate the maximum value reached after the first backtrack
max_after_backtrack <- backtracks_df %>%
  mutate(max_after_backtrack = sapply(seq, function(x) max(x[x > x[1]]))) %>%
  summarise(max_after_backtrack = max(max_after_backtrack))

#4: Calculate the frequency counts for even and odd backtracking integers
even_odd_backtrack <- backtracks_df %>%
  summarise(
    Even = sum(start %% 2 == 0),
    Odd = n() - sum(start %% 2 == 0)
  )

print("Most frequently occurring backtrack count:")
print(mode_backtrack$mode_backtrack)
print("Maximum value after the first backtrack:")
print(max_after_backtrack$max_after_backtrack)
print("Frequency of backtracking among even and odd starting integers:")
print("Even:", even_odd_backtrack$Even)
print("Odd:", even_odd_backtrack$Odd)
