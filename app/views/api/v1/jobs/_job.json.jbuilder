
user = job.user

json.user do
  json.id user.id
  json.email user.email
  json.role user.role.name
end
json.id job.id
json.name job.name
json.address job.address
json.description job.description
