# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaxonomySplitter::Null do
  describe '.create' do
    subject { described_class.create(name) }

    context 'with any name' do
      let(:name) { TaxonomySplitter::Name.new('Any Name') }

      it { is_expected.to be_an_instance_of(described_class) }
    end
  end

  describe '#call' do
    subject { described_class.create(name).call }

    context 'with any name' do
      let(:name) { TaxonomySplitter::Name.new('Any Name') }

      it { is_expected.to eq({ genus: 'UNKNOWN', species: 'UNKNOWN' }) }
    end
  end
end
