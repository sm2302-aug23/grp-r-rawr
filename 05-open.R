## Open-ended exploration

# What is the most frequent integer that appears in all the sequences combined, excluding the number 1?

library(tidyverse)

# Combine all sequences, excluding the number 1
combined_sequences <- collatz_df %>%
  pull(seq) %>%
  unlist() %>%
  .[. != 1]

# Count frequencies of each integer
frequency_counts <- table(combined_sequences)

# The most frequent integer
most_frequent_integer <- as.numeric(names(which.max(frequency_counts)))

# Findings
print(paste("The most frequent integer (excluding 1) is:", most_frequent_integer))

#[1] "The most frequent integer (excluding 1) is: 2"

#When running the script, the code will identify the integer that appears most frequently in the combined Collatz sequences, excluding the integer 1.
#For instance, our finding for the most frequent integer (excluding 1) is 2, this indicates that the integer 2 is the most commonly occuring value than any other integer in the combined sequences, excluding the number 1.