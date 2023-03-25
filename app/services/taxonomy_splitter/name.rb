# frozen_string_literal: true

class TaxonomySplitter
  class Name
    attr_reader :full

    def initialize(name)
      @full = name.to_s
    end

    def split = @split ||= @full.split(/\s+/)
  end
end
