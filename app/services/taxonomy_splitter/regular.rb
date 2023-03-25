# frozen_string_literal: true

class TaxonomySplitter
  class Regular
    def initialize(name)
      @name = name
    end

    def self.create(name) = new(name)

    def call = { genus: @name.split.first.titleize, species: @name.split.second.titleize }
  end
end
