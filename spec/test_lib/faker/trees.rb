# frozen_string_literal: true

module Faker
  class Trees < Base
    class << self
      def genus = fetch('tree.genus')
      def species = fetch('tree.species')
    end
  end
end
