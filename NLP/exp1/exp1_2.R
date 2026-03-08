# Install packages
install.packages("tidytext")
install.packages("dplyr")

# Load libraries
library(tidytext)
library(dplyr)

# Text Data
text_data <- data.frame(
  text = "The workshop was excellent and very helpful, but the long lecture made some students feel tired.",
  stringsAsFactors = FALSE
)

# Tokenization
tokens <- text_data %>%
  unnest_tokens(word, text)

# Sentiment analysis - Bing lexicon
sentiment <- tokens %>%
  inner_join(get_sentiments("bing"), by = "word")

print(sentiment)