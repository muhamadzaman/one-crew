class EstimateSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :job
  has_many :estimate_details

  attributes :id, :name, :description, :user, :total_cost
end
