# frozen_string_literal: true

class Tree < ApplicationRecord
  belongs_to :borough
  belongs_to :species
  validates :gla_id, uniqueness: true
  delegate :genus, to: :species
end
