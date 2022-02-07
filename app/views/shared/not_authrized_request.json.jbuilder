code ||= 401
message ||= "You are not authorized"

json.message "You are not authorized"
json.error do
  json.code code
  json.message message
end
