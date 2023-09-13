library(dplyr)

collatz_df <- collatz_df %>%
  mutate(seq_length = sapply(seq, length))

#1 Find top 10 longest sequences
top10longest <- collatz_df %>%
  arrange(desc(seq_length)) %>%
  head(10)

print(collatz_df)
#      A tibble: 10,000 × 6
#        start seq        length parity max_val seq_length
#     <int> <list>     <list> <list> <list>       <int>
# 1      1 <chr [1]>  <NULL> <NULL> <NULL>           1
# 2      2 <chr [2]>  <NULL> <NULL> <NULL>           2
# 3      3 <chr [8]>  <NULL> <NULL> <NULL>           8
# 4      4 <chr [3]>  <NULL> <NULL> <NULL>           3
# 5      5 <chr [6]>  <NULL> <NULL> <NULL>           6
# 6      6 <chr [9]>  <NULL> <NULL> <NULL>           9
# 7      7 <chr [17]> <NULL> <NULL> <NULL>          17
# 8      8 <chr [4]>  <NULL> <NULL> <NULL>           4
# 9      9 <chr [20]> <NULL> <NULL> <NULL>          20
# 10    10 <chr [7]>  <NULL> <NULL> <NULL>           7

