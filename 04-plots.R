library (tidyverse)
library(ggplot2)


ggplot(collatz_df, aes(x = start, y = lengths(seq))) +
  geom_point() +
  geom_text(data = top10longest, aes(label = start), vjust = -0.5) +
  labs(x = "Starting Integer", y = "Length of Sequence") +
  ggtitle("Scatterplot of Sequence Lengths")


ggplot(collatz_df, aes(x = start, y = sapply(seq, max))) +
  geom_point(aes(colour = start %in% top10longest$start)) +
  labs(x = "Starting Integer", y = "Highest Value Reached", colour = "Integer") +
  ggtitle("Scatterplot of Highest Values Reached")


ggplot(collatz_df, aes(x = as.factor(start %% 2 == 0), y = lengths(seq))) +
  geom_boxplot() +
  labs(x = "Starting Integer (Even/Odd)", y = "Length of Sequence") +
  ggtitle("Boxplot of Sequence Lengths by Even/Odd Starting Integers")
