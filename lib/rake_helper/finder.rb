# frozen_string_literal: true

module RakeHelper
  class Finder
    def initialize
      @genera = {}
      @species = {}
      @boroughs = {}
    end

    def species(name)
      taxon = TaxonomySplitter.new(name).call
      genus = @genera[taxon[:genus]] ||= Genus.find_or_create_by(name: taxon[:genus])
      @species[taxon[:genus]] ||= {}
      @species[taxon[:genus]][taxon[:species]] ||= Species.find_or_create_by(name: taxon[:species], genus:)
    end

    def borough(name) = @boroughs[name] ||= Borough.find_or_create_by(name:)
  end
end
