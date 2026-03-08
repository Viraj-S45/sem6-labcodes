# Install packages
install.packages("tidytext")
install.packages("dplyr")
install.packages("tm")
install.packages("SnowballC")
install.packages("textstem")

# Load libraries
library(tidytext)
library(dplyr)
library(tm)
library(SnowballC)
library(textstem)

# Text data
text_data <- data.frame(
  text = "Natural language processing enables computers to understand human language and extract useful insights from text.",
  stringsAsFactors = FALSE
)

# Tokenization
tokens <- text_data %>%
  unnest_tokens(word, text)

print("Tokenized Words:")
print(tokens$word)

# Stopword removal
data("stop_words")

filtered_words <- tokens %>%
  anti_join(stop_words, by = "word")

print("After Stopword Removal:")
print(filtered_words$word)

# Stemming
stemmed_words <- wordStem(filtered_words$word)

print("After Stemming:")
print(stemmed_words)

# Lemmatization
lemmatized_words <- lemmatize_words(filtered_words$word)

print("After Lemmatization:")
print(lemmatized_words)