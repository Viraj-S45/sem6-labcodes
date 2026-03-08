# Install packages
install.packages("tidytext")
install.packages("dplyr")
install.packages("tokenizers")

# Load libraries
library(tidytext)
library(dplyr)
library(tokenizers)

# Text data
text <- "Natural language processing helps computers understand human language and extract meaningful information from text data."

# Segmentation
sentences <- tokenize_sentences(text)[[1]]
print("Sentences:")
print(sentences)

# Tokenization
tokens <- tokenize_words(text)[[1]]

print("Tokenized Words:")
print(tokens)

# Bigrams
bigrams <- tokenize_ngrams(text, n = 2)[[1]]

print("Bigrams:")
print(bigrams)

# Trigrams
trigrams <- tokenize_ngrams(text, n = 3)[[1]]

print("Trigrams:")
print(trigrams)