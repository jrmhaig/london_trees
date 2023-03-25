# frozen_string_literal: true

class TaxonomySplitter
  class UnknownSpecies
    def initialize(name)
      @name = name
    end

    def self.create(name)
      return unless name.split.second.nil? || name.full.match(/(unk species|sp.)/i)

      new(name)
    end

    def call = { genus: @name.split.first, species: 'UNKNOWN' }
  end
end
