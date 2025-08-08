# Godot-R Bridge Template

An example project for connecting Godot applications with R backends via HTTP API using the plumber package.

## Prerequisites

### R Dependencies
Install the required R packages:

```r
install.packages(c("plumber", "jsonlite"))
```

### Godot Version

Godot 4.x (tested with HTTPRequest nodes)

## Running the R Server

Navigate to the R directory:
located in res://R

Start the server:
```# In R or RStudio
source("server.R")
```

Or from command line:
```
bashRscript server.R
```

Verify the server is running:

You should see: `Running plumber API at http://127.0.0.1:8000`
Test in browser: `http://127.0.0.1:8000/test`
Expected response: `{"message":["Hello to Godot from R!"]}`

## Running the Godot Client

Open the Godot project
Run the main scene
Click the test button

```
Project Structure
├── godot-project/
│   ├── connectionTest/  # Location of Test Scene
│   └── icons/           # Contains R and Godot logos
│   ├── R/
│       ├── server.R          # Main server file
│       └── api.R             # API endpoints (optional)
└── README.md
```

## Troubleshooting

Port 8000 in use: Change port in `server.R` and update Godot script
Connection refused: Ensure R server is running before starting Godot
404 errors: Verify endpoint paths match between R (`@get /test`) and Godot (`/test`)

## Dependencies Summary

R Packages:<br>
`plumber` (web API framework)<br>
`jsonlite` (JSON handling, auto-installed with plumber)


## Example:

It's not much to look at, but it's honest work.

https://github.com/user-attachments/assets/191eae39-bbbe-4230-af2c-23ee0091c083




