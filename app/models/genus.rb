# frozen_string_literal: true

class Genus < ApplicationRecord
  has_many :species, dependent: :restrict_with_exception
end
