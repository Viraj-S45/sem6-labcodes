# Install packages
install.packages("udpipe")

# Load library
library(udpipe)

# language model
model <- udpipe_download_model(language = "english")

# Load the model
ud_model <- udpipe_load_model(model$file_model)

# Text data
text_input <- "The small brown dog chased the frightened little cat near the tall green tree in the quiet park"

# POS tagging
annotation <- udpipe_annotate(ud_model, x = text_input)
annotation_df <- as.data.frame(annotation)

# Chunking Rule
noun_phrases <- c()
current_chunk <- c()

for (i in 1:nrow(annotation_df)) {
  tag <- annotation_df$upos[i]
  word <- annotation_df$token[i]
  if (tag %in% c("DET", "ADJ")) {
    current_chunk <- c(current_chunk, word)
  } else if (tag == "NOUN") {
    current_chunk <- c(current_chunk, word)
    noun_phrases <- c(noun_phrases, paste(current_chunk, collapse = " "))
    current_chunk <- c()
  } else {
    current_chunk <- c()
  }
}

cat("\nExtracted Noun Phrases:\n")
print(noun_phrases)