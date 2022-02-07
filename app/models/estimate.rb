class Estimate < ApplicationRecord
  belongs_to :job
  belongs_to :user

  has_many :estimate_details

  accepts_nested_attributes_for :estimate_details
end
