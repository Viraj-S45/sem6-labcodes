# Install packages
install.packages("stringr")
install.packages("tm")

# Load libraries
library(stringr)
library(tm)

# Preprocess (lowercase, remove punctuation, stopwords)
preprocess <- function(text) {
  text <- tolower(text)
  text <- removePunctuation(text)
  words <- unlist(str_split(text, " "))
  words <- words[!words %in% stopwords("en")]
  return(words)
}

# Lesk Algorithm
lesk_wsd <- function(sentence, target_word, senses) {
  
  context <- preprocess(sentence)
  max_overlap <- 0
  best_sense <- ""
  
  for (sense in names(senses)) {
    sense_words <- preprocess(senses[[sense]])
    
    # Count overlapping words
    overlap <- length(intersect(context, sense_words))
    
    if (overlap > max_overlap) {
      max_overlap <- overlap
      best_sense <- sense
    }
  }
  
  return(best_sense)
}

# ambiguous word: "bank"
senses <- list(
  "Financial Institution" = "bank is a place where people deposit money and withdraw cash",
  "River Side" = "bank is the land alongside a river or stream"
)

# Text Input
sentence1 <- "I deposited money in the bank yesterday"
sentence2 <- "He sat on the bank of the river"

# WSD
result1 <- lesk_wsd(sentence1, "bank", senses)
result2 <- lesk_wsd(sentence2, "bank", senses)

cat("Sentence 1:", sentence1, "\nPredicted Sense:", result1, "\n\n")
cat("Sentence 2:", sentence2, "\nPredicted Sense:", result2, "\n")