# frozen_string_literal: true

FactoryBot.define do
  factory :tree do
    sequence(:gla_id) { |i| i }
    species { create(:species, name: Faker::Trees.species) }
    borough { create(:borough, name: Faker::Address.state) }
  end
end
