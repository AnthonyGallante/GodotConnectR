library(plumber)

# Local computer host and a test port
host <- "127.0.0.1"
port <- 8000

pr("api.R") %>%
  pr_run(
    host=host, 
    port=port
  )