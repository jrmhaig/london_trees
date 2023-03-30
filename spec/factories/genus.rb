# frozen_string_literal: true

FactoryBot.define do
  factory :genus do
    name { Faker::Trees.unique.genus }

    to_create do |instance|
      instance.attributes = Genus.find_or_create_by(name: instance.name).attributes
      instance.reload
    end
  end
end
