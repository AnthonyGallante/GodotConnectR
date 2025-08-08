extends Control

# Normally, you would want to dynamically create new http requests as you need them. 
# Here, we see that we can treat a http request as if it were any other node!
@onready var http_request: HTTPRequest = $HTTPRequest

# This should match the host:port/request that is defined in our run_server.R and api.R files
var url = "http://127.0.0.1:8000/test"


func _on_request_completed(_result: int, response_code: int, _headers: PackedStringArray, body: PackedByteArray):
	# If we receive an "OK" response code
	if response_code == 200:
		var json = JSON.new()
		var raw_response = body.get_string_from_utf8()
		var parse_result = json.parse(raw_response)
		
		# Ensure that the message was correctly parsed:
		if parse_result == OK:
			var data_from_R = json.data
			
			# Update label and print to console
			$Label.text = data_from_R.message[0]
			print("R says: ", data_from_R.message)

		else:
			print("JSON parse failed")
		
	else:
		# Print a response code for debugging purposes
		print("Request failed with code: ", response_code)


# When the http request is completed, we can choose to run a function:
func call_r_function():
	http_request.request_completed.connect(_on_request_completed)
	http_request.request(url)

# This function is connected to our Button in the test scene
func _on_button_pressed() -> void:
	call_r_function()
