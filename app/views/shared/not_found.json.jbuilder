code ||= 404
message ||= "Not Found"

json.message "Not Found"
json.error do
  json.code code
  json.message message
end
