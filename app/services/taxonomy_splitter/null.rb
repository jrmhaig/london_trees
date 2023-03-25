# frozen_string_literal: true

class TaxonomySplitter
  class Null
    def initialize(*); end

    def self.create(name) = new(name)

    def call = { genus: 'UNKNOWN', species: 'UNKNOWN' }
  end
end
