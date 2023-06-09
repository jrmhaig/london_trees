# frozen_string_literal: true

class Species < ApplicationRecord
  belongs_to :genus
  has_many :trees, dependent: :restrict_with_exception
end
