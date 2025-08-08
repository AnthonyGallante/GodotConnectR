library(plumber)

# Test function that sends a message back to Godot
connectionTest <- function() {
  m <- "Hello to Godot from R!"
  return(m)
}

# Testing basic request
#* @get /test
function() {
  response <- list(message = connectionTest())
  return(response)
}