## Open-ended exploration

#1 What is the most frequent integer that appears in all the sequences combined, excluding the number 1?

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


#2 Is there any correlation between the starting integers and the number of odd or even numbers in their sequence?




#3 What are the most common “stopping times,” i.e., the number of steps it takes for a sequence to first go below its starting integer?

