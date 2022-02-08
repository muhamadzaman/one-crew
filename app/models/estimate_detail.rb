class EstimateDetail < ApplicationRecord
  belongs_to :estimate

  validates :job, :units, :rate, :cost, :estimate_category, :unit_of_measure, presence: true

  before_save :calculate_bid

  private
    def calculate_bid
      self.bid = time.present? ? time * units * cost : units * cost
    end
end
