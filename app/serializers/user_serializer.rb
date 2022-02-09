class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :role

  def role
    @object.role.name
  end
end
