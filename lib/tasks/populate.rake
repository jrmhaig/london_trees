# frozen_string_literal: true

namespace :populate do
  desc 'Populate tree, genus and species models from file'
  task :trees, [:filename] => :environment do |_, args|
    Populater.new(args[:filename]).call
  end
end
