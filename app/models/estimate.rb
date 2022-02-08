class Estimate < ApplicationRecord
  belongs_to :job
  belongs_to :user

  has_many :estimate_details, dependent: :destroy

  accepts_nested_attributes_for :estimate_details

  def total_cost
    estimate_details.sum(:bid)
  end
end
