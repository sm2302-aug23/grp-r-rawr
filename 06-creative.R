library(tidyverse)

gen_collatz <- function(n) {
  sequence <- numeric(0)
  while (n != 1) {
    sequence <- c(sequence, n)
    if (n %% 2 == 0) {
      n <- n / 2
    } else {
      n <- 3 * n + 1
    }
  }
  return(c(sequence, 1))
}

start_integers <- 1:10000
sequence_lengths <- sapply(start_integers, function(x) length(gen_collatz(x)))
df <- data.frame(Starting_Integer = start_integers, Sequence_Length = sequence_lengths)

ggplot(df, aes(x = Starting_Integer, y = Sequence_Length, fill = Sequence_Length)) +
  geom_tile() +
  scale_fill_gradient(low = "green", high = "red") +
  labs(x = "Starting Integer", y = "Sequence Length to Reach 1", fill = "Sequence Length") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
