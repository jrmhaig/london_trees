# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaxonomySplitter::Crossbreed do
  describe '.create' do
    subject { described_class.create(name) }

    context 'with a crossbreed name' do
      let(:name) { TaxonomySplitter::Name.new('Acer x freemanii') }

      it { is_expected.to be_an_instance_of(described_class) }
    end

    context 'with a regular name' do
      let(:name) { TaxonomySplitter::Name.new('Abeis grandis') }

      it { is_expected.to be_nil }
    end
  end

  describe '#call' do
    subject { described_class.create(name).call }

    context 'with a crossbreed name' do
      let(:name) { TaxonomySplitter::Name.new('Acer x freemanii') }

      it { is_expected.to eq({ genus: 'Acer', species: 'x Freemanii' }) }
    end
  end
end
