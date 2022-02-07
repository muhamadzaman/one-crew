json.estimate do
  json.id estimate.id
  json.name estimate.name
  json.description estimate.description
  json.estimate_details do
    json.partial! 'estimates/estimate_detail', collection: estimate.estimate_details, as: :estimate_detail
  end
end