Fabricator(:device) do
  token { Faker::Internet.device_token }
end