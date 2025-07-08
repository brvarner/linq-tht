# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

require "faker"

Contact.destroy_all

10.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name

  Contact.create!(
    name: "#{first} #{last}",
    email: "#{first}@example.com"
  )

end

pp "10 contacts created" 