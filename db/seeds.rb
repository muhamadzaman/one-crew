# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

['admin', 'client', 'contractor'].each { |role| Role.find_or_create_by!(name: role) }

['Labor', 'Materials', 'Equipment'].each { |category| EstimateCategory.find_or_create_by!(name: category) }

# Users
admin = User.find_by(name: 'admin')
role = Role.find_by(name: 'admin')
admin ||= User.create(role: role, email: 'admin@example.com', name: 'admin', nickname: 'admin')
admin.update(password: 'defaultpass', password_confirmation: 'defaultpass')
admin.save!
