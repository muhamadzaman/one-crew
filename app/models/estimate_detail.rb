class EstimateDetail < ApplicationRecord
  belongs_to :estimate
  belongs_to :estimate_category

  validates :job, :units, :rate, :cost, presence: true

  before_save :calculate_bid

  private
    def calculate_bid
      self.bid = time.present? ? time * units * cost : units * cost
    end
end
