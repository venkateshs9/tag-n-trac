Fabricator(:shipment) do
  item { Faker::Name.name }
  source { Faker::Address.city }
  destination { Faker::Address.city }
  customer_id { Fabricate(:user, user_type: 'customer').id }
end
