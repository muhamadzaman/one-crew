class EstimateDetail < ApplicationRecord
  belongs_to :estimate
  belongs_to :estimate_category

  validates :job, :units, :rate, :cost, :bid, presence: true
end
