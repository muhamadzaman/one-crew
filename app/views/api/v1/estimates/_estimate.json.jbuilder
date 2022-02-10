
user = estimate.user

json.id estimate.id
json.name estimate.name
json.description estimate.description
json.total_cost estimate.total_cost
json.user do
  json.id user.id
  json.email user.email
  json.role user.role.name
end
json.estimate_details do
  json.partial! 'api/v1/estimates/estimate_detail', collection: estimate.estimate_details, as: :estimate_detail
end
