# frozen_string_literal: true

class TaxonomySplitter
  MATCHERS = [
    TaxonomySplitter::Unknown,
    TaxonomySplitter::UnknownSpecies,
    TaxonomySplitter::Crossbreed,
    TaxonomySplitter::Regular,
    TaxonomySplitter::Null
  ].freeze

  def initialize(taxon_name)
    @taxon_name = taxon_name
  end

  def call
    name = TaxonomySplitter::Name.new(@taxon_name)
    MATCHERS.filter_map { |m| m.create(name) }.lazy.first.call
  end
end
