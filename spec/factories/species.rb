# frozen_string_literal: true

FactoryBot.define do
  factory :species do
    name { Faker::Trees.unique.species }
    genus { create(:genus, name: Faker::Trees.genus) }

    to_create do |instance|
      instance.attributes = Species.find_or_create_by(name: instance.name, genus: instance.genus).attributes
      instance.reload
    end
  end
end
