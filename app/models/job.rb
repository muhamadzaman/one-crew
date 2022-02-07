class Job < ApplicationRecord
  belongs_to :user
  has_many :estimates

  validates :name, presence: true
end
