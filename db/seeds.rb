Country.create(name: "france")
Country.create(name: "italy")

City.create(name: "paris", country_id: Country.find_by(name: "france").id)
City.create(name: "nice", country_id: Country.find_by(name: "france").id)
City.create(name: "roma", country_id: Country.find_by(name: "italy").id)
City.create(name: "venezia", country_id: Country.find_by(name: "italy").id)AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')