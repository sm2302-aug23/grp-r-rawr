library (tidyverse)
library(ggplot2)

#1. Create a scatterplot of all the sequence lengths, with the starting integer on the horizontal axis and the length of the sequence on the vertical axis.
    Identify the top 10 starting integers on your plot.
ggplot(collatz_df, aes(x = start, y = lengths(seq))) +
  geom_point() +
  geom_text(data = top10longest, aes(label = start), vjust = -0.5) +
  labs(x = "Starting Integer", y = "Length of Sequence") +
  ggtitle("Scatterplot of Sequence Lengths")

#2. Create another scatterplot, but this time graph the highest value reached in the sequence on the vertical axis.
    Highlight the top 10 starting integers in a different color.
ggplot(collatz_df, aes(x = start, y = sapply(seq, max))) +
  geom_point(aes(color = start %in% top10longest$start)) +
  labs(x = "Starting Integer", y = "Highest Value Reached") +
  ggtitle("Scatterplot of Highest Values Reached")

#3. Create a boxplot comparing the distributions of sequence lengths for even and odd starting integers. Are there any noticeable differences?
ggplot(collatz_df, aes(x = as.factor(start %% 2 == 0), y = lengths(seq))) +
  geom_boxplot() +
  labs(x = "Starting Integer (Even/Odd)", y = "Length of Sequence") +
  ggtitle("Boxplot pf Sequence Lengths by Even/Odd Starting Integers")
