Fabricator(:ab_test) do
  title { Faker::String.random(length: 3..12) }
  probabilities { [65, 35] }
  options { Array.new(rand(2..6), Faker::String.random(length: 3..12))  }
end