library(tidyverse)

gen_collatz <- function(n) {
  sequence <- c() 
  
  if (!is.integer(n) || n <= 0) {
    stop("Input must be a positive integer.") 
  }
  
  #generate the sequence
  while (n != 1) { 
    sequence <- c(sequence, n)
    if (n %% 2 == 0) {
      n <- n / 2
    } else {
      n <- 3 * n + 1
    }
  }
  
  sequence <- c(sequence, 1) 
  
  return(sequence)
}


#tibble for the function application
collatz_df <- tibble(
  start = 1:10000
) %>%
  mutate(seq = map(start, gen_collatz)) %>%
  mutate(
    length = map_dbl(seq, ~length(.x)),
    parity = ifelse(start %% 2 == 0, "Even", "Odd"),
    max_val = map_dbl(seq, ~max(.x))
  )

head(collatz_df, 10)

# # A tibble: 10 × 5
#   start seq        length parity max_val
#   <int> <list>      <dbl> <chr>    <dbl>
#  1     1 <dbl [1]>       1 Odd          1
#  2     2 <dbl [2]>       2 Even         2
#  3     3 <dbl [8]>       8 Odd         16
#  4     4 <dbl [3]>       3 Even         4
#  5     5 <dbl [6]>       6 Odd         16
#  6     6 <dbl [9]>       9 Even        16
#  7     7 <dbl [17]>     17 Odd         52
#  8     8 <dbl [4]>       4 Even         8
#  9     9 <dbl [20]>     20 Odd         52
# 10    10 <dbl [7]>       7 Even        16
