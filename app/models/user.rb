# frozen_string_literal: true

class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  belongs_to :role
  has_many :estimates
  has_many :jobs

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_blank: true

  before_validation :set_role, on: :create

  def admin?
    role.name == 'admin'
  end

  def client?
    role.name == 'client'
  end

  def contractor?
    role.name == 'contractor'
  end

  private
    def set_role
      self.role ||= Role.find_by(name: 'placeholder')
    end
end
