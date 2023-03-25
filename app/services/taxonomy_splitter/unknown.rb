# frozen_string_literal: true

class TaxonomySplitter
  class Unknown
    def initialize(*); end

    def self.create(name)
      return unless name.full.blank? || name.full.match?(/^Zz/)

      new(name)
    end

    def call = { genus: 'UNKNOWN', species: 'UNKNOWN' }
  end
end
