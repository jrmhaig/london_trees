# frozen_string_literal: true

FactoryBot.define do
  factory :borough do
    name { Faker::Address.unique.state }

    to_create do |instance|
      instance.attributes = Borough.find_or_create_by(name: instance.name).attributes
      instance.reload
    end
  end
end
