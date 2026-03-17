# Install packages
install.packages("stringr")

# Load library
library(stringr)

# simple salience score
get_score <- function(position, role) {
  score <- 0
  
  # Recency (closer noun gets higher score)
  score <- score + (10 - position)
  
  # Grammatical role (simple assumption: first noun = subject)
  if (role == "subject") {
    score <- score + 5
  } else {
    score <- score + 2
  }
  
  return(score)
}

# Pronoun resolution function
resolve_pronoun <- function(sentence, pronoun) {
  words <- unlist(str_split(sentence, " "))
  # Identify candidate nouns (simple: capitalized words except pronoun)
  candidates <- words[grepl("^[A-Z]", words) & tolower(words) != pronoun]
  if (length(candidates) == 0) {
    return("No antecedent found")
  }
  scores <- c()
  for (i in seq_along(candidates)) {
    # Assume first candidate is subject, rest are objects
    role <- ifelse(i == 1, "subject", "object")
    score <- get_score(i, role)
    scores <- c(scores, score)
  }
  # Select candidate with highest score
  best <- candidates[which.max(scores)]
  return(best)
}

# Text Data
sentence1 <- "Riya dropped the glass because she was careless"
sentence2 <- "Aman met Rahul and he was happy"

# Apply pronoun resolution
result1 <- resolve_pronoun(sentence1, "she")
result2 <- resolve_pronoun(sentence2, "he")

cat("Sentence 1:", sentence1, "\nPronoun refers to:", result1, "\n\n")
cat("Sentence 2:", sentence2, "\nPronoun refers to:", result2, "\n")