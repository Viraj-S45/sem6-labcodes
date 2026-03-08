# Install packages
install.packages("tm")
install.packages("rvest")

# Load libraries
library(tm)
library(rvest)

# Text Data
text <- "<p>Natural Language Processing is an exciting field! It allows computers to understand human language and extract meaningful insights from text data.</p> Visit https://example.com for more information."

# Remove HTML tags
text <- read_html(paste0("<body>", text, "</body>")) %>% html_text()

# lowercase
text <- tolower(text)

# Remove punctuation
text <- removePunctuation(text)

# Stopwords Removal
text <- removeWords(text, stopwords("en"))

# Remove whitespace
text <- stripWhitespace(text)

print(text)