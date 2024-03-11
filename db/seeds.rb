# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
v = Vehicle.create(brand: 'Teste', year: '1995', license_plate: '000000', model: 'teste')
i = Insured.create(name: 'teste', cpf:'00000000000')

Policy.create(emission_date: Date.today, end_date_coverage: Date.today, vehicle_id:v.id, insured_id: i.id)
