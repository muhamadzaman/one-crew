# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

['admin', 'client', 'contractor', 'placeholder'].each { |role| Role.find_or_create_by!(name: role) }

# User
password = ENV['ADMIN_PASSWORD']
email = ENV['ADMIN_EMAIL']
if password && email
  admin = User.find_by(name: 'admin')
  role = Role.find_by(name: 'admin')
  admin ||= User.create(role: role, email: email, name: 'admin', nickname: 'admin')
  admin.update(password: password, password_confirmation: password)
  admin.save!
else
  raise 'Please provide admin user password and email using ADMIN_PASSWORD and ADMIN_EMAIL'
end

User.create(email: 'client@example.com', name: 'client', password: '123456', role: Role.find_by(name: 'client'))
User.create(email: 'contractor@example.com', name: 'contractor', password: '123456', role: Role.find_by(name: 'contractor'))
