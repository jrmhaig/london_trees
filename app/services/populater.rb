# frozen_string_literal: true

require 'csv'

class Populater
  def initialize(filename)
    @filename = filename
  end

  def call
    File.open(@filename, 'r') do |file|
      Populater::Collection.transaction do |collection|
        csv = CSV.new(file, headers: true)

        while (row = csv.shift)
          collection.add(row)
        end
      end
    end
  end
end
