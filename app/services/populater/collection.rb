# frozen_string_literal: true

class Populater
  class Collection
    BATCH_SIZE = 10_000

    attr_accessor :id_key

    def initialize
      @trees = []
      @genera = {}
      @species = {}
      @boroughs = {}

      @total = 0
    end

    def add(row)
      # The first header may include the Byte Order Mark (BOM) so just using
      # 'objectid' as the key doesn't return anything. To get round this, just
      # presume that the first column is the gla_id.
      # See https://estl.tech/of-ruby-and-hidden-csv-characters-ef482c679b35

      @trees << {
        gla_id: row.first,
        species_id: species(row['taxon_name']).id,
        borough_id: borough(row['borough']).id,
        lat: row['latitude'],
        lon: row['longitude']
      }

      write if @trees.count >= BATCH_SIZE
    end

    # rubocop:disable Rails/SkipsModelValidations
    def write
      return if @trees.empty?

      @total += @trees.count
      Tree.insert_all(@trees)
      @trees = []
    end
    # rubocop:enable Rails/SkipsModelValidations

    def self.transaction
      collection = new

      ActiveRecord::Base.transaction do
        yield collection

        collection.write
      end
    end

    private

    def species(name)
      taxon = TaxonomySplitter.new(name).call
      genus = @genera[taxon[:genus]] ||= Genus.find_or_create_by(name: taxon[:genus])
      @species[taxon[:genus]] ||= {}
      @species[taxon[:genus]][taxon[:species]] ||= Species.find_or_create_by(name: taxon[:species], genus:)
    end

    def borough(name) = @boroughs[name] ||= Borough.find_or_create_by(name:)
  end
end
