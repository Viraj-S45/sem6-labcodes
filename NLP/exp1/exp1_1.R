# Install packages
install.packages("text")
install.packages("tidytext")
install.packages("dplyr")
install.packages("readr")

# Load libraries
library(text)
library(tidytext)
library(dplyr)
library(readr)

# Text Data
text_data <- tibble(
  line = 1,
  text = "Natural language processing helps computers understand human language and extract useful information from text."
)

# Tokenization
tokens <- text_data %>%
  unnest_tokens(word, text)

# Stop words Removal
data("stop_words")

tokens_clean <- tokens %>%
  anti_join(stop_words, by = "word")

print(tokens_clean)