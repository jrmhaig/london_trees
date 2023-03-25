# frozen_string_literal: true

class TaxonomySplitter
  class Crossbreed
    def initialize(name)
      @name = name
    end

    def self.create(name)
      return unless name.split.second == 'x'

      new(name)
    end

    def call = { genus: @name.split.first, species: "x #{@name.split.third.titleize}" }
  end
end
