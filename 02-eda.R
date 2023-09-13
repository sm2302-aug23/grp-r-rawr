library(dplyr)

collatz_df <- collatz_df %>%
  mutate(seq_length = sapply(seq, length))

#1 Find top 10 longest sequences
top10longest <- collatz_df %>%
  arrange(desc(seq_length)) %>%
  head(10)

print(collatz_df)

#  A tibble: 10,000 × 6
#        start seq        length parity max_val seq_length
#      <int> <list>      <dbl> <chr>    <dbl>      <int>
#  1     1 <dbl [1]>       1 Odd          1          1
#  2     2 <dbl [2]>       2 Even         2          2
#  3     3 <dbl [8]>       8 Odd         16          8
#  4     4 <dbl [3]>       3 Even         4          3
#  5     5 <dbl [6]>       6 Odd         16          6
#  6     6 <dbl [9]>       9 Even        16          9
#  7     7 <dbl [17]>     17 Odd         52         17
#  8     8 <dbl [4]>       4 Even         8          4
#  9     9 <dbl [20]>     20 Odd         52         20
#  10    10 <dbl [7]>       7 Even        16          7

#2 Find the row where the maximum value in the sequence is achieved
max_val_int <- collatz_df %>%
  mutate(max_value = sapply(seq, max)) %>%
  filter(max_value == max(max_value))

print(max_val_int)

# A tibble: 1 × 7
#   start seq         length parity  max_val seq_length max_value
# <int> <list>       <dbl> <chr>     <dbl>      <int>     <dbl>
#  1  9663 <dbl [185]>    185 Odd    27114424        185  27114424
