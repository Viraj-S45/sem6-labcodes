# Install packages
install.packages("udpipe")

# Load library
library(udpipe)

# language model
model <- udpipe_download_model(language = "english")

# Load the model
ud_model <- udpipe_load_model(model$file_model)

# Text data
text <- "Learning data analytics and natural language processing makes studying easier and more interesting."

# Annotation
annotation <- udpipe_annotate(ud_model, x = text)

result <- as.data.frame(annotation)

print("POS Tagged Words:")
print(result[, c("token", "upos")])