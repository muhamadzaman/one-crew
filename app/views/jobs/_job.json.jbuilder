
user = job.user

json.job do
  json.user do
    json.id user.id
    json.email user.email
  end
  json.id job.id
  json.name job.name
  json.description job.description
end
