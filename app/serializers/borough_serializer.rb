# frozen_string_literal: true

class BoroughSerializer
  include JSONAPI::Serializer

  attribute(:borough, &:name)
  attribute(:trees) { |object| object.trees.count }
end
