# frozen_string_literal: true

class Borough < ApplicationRecord
  has_many :trees, dependent: :restrict_with_exception
end
