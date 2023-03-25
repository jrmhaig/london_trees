# frozen_string_literal: true

class Species < ApplicationRecord
  belongs_to :genus
end
