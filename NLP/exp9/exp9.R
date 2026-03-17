# Install & Spacy
install.packages("spacyr")
library(spacyr)

# Initialize spaCy
spacy_initialize()

# NER Function
perform_ner <- function(text) {
  parsed <- spacy_parse(text, entity = TRUE)
  # Filter valid entity rows
  entities <- parsed[parsed$entity != "" & !is.na(parsed$entity), ]
  if (nrow(entities) == 0) {
    return("No entities found")
  }
  results <- data.frame(Entity = character(), Type = character(), stringsAsFactors = FALSE)
  current_entity <- ""
  current_type <- ""
  for (i in seq_len(nrow(entities))) {
    token <- entities$token[i]
    tag <- entities$entity[i]
    clean_type <- sub("_[BI]$", "", tag)
    if (grepl("_B$", tag)) {
      if (current_entity != "") {
        results <- rbind(results, data.frame(Entity = current_entity, Type = current_type))
      }
      current_entity <- token
      current_type <- clean_type
    } else if (grepl("_I$", tag)) {
      current_entity <- paste(current_entity, token)
    }
  }
  # Add last entity
  if (current_entity != "") {
    results <- rbind(results, data.frame(Entity = current_entity, Type = current_type))
  }
  return(unique(results))
}

# Text Data
text <- paste(
  "Elon Musk is the CEO of Tesla.",
  "He visited India and New York.",
  "Microsoft Corporation and Google are big companies.",
  "Sundar Pichai lives in California."
)

# Apply NER
result <- perform_ner(text)

# Output
cat("Text:\n", text, "\n\n")
print(result)

# Finalize
spacy_finalize()