class EstimateDetailSerializer < ActiveModel::Serializer
  belongs_to :estimate

  attributes :id, :job, :units, :time, :rate, :cost, :margin_multiple, :estimate_category, :unit_of_measure, :bid
end
