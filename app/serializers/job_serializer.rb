class JobSerializer < ActiveModel::Serializer
  belongs_to :user

  attributes :id, :name, :address, :description
end
