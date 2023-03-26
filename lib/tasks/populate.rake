# frozen_string_literal: true

require 'rake_helper/finder'
require 'csv'

# Allow Tree.insert_all
# rubocop:disable Rails/SkipsModelValidations
namespace :populate do
  desc 'Populate tree, genus and species models from file'
  task :trees, [:filename] => :environment do |_, args|
    finder = RakeHelper::Finder.new
    trees = []

    File.open(args[:filename], 'r') do |file|
      csv = CSV.new(file, headers: true)
      # The first header may include the Byte Order Mark (BOM) so just using
      # 'objectid' as the key doesn't return anything. To get round this, fetch
      # the correct key from the headers.
      # See https://estl.tech/of-ruby-and-hidden-csv-characters-ef482c679b35
      id_key = csv.first.headers.first

      while (row = csv.shift)
        trees << {
          gla_id: row[id_key],
          species_id: finder.species(row['taxon_name']).id,
          borough_id: finder.borough(row['borough']).id,
          lat: row['latitude'],
          lon: row['longitude']
        }

        next if trees.count < 10_000

        Tree.insert_all(trees)
        print '.'
        trees = []
      end
    end

    Tree.insert_all(trees)
    puts '.'
  end
end
# rubocop:enable Rails/SkipsModelValidations
