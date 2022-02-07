code ||= 1002

json.message "Validations Failed"
json.error do
  json.code code
  json.message exception.message
  json.fields exception.record.errors
end
