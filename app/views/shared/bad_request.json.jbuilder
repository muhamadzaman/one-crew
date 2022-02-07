code ||= 400
message ||= "Bad Request"

json.message "Bad Request"
json.error do
  json.code code
  json.message message
end
