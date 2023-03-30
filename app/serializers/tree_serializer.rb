# frozen_string_literal: true

class TreeSerializer
  include JSONAPI::Serializer
  attributes :lat, :lon

  attribute(:borough) { |object| object.borough.name }
  attribute(:genus) { |object| object.genus.name }
  attribute(:species) { |object| object.species.name }
end
