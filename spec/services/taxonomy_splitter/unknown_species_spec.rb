# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaxonomySplitter::UnknownSpecies do
  describe '.create' do
    subject { described_class.create(name) }

    context 'with a unk species' do
      let(:name) { TaxonomySplitter::Name.new('Aesculus unk species') }

      it { is_expected.to be_an_instance_of(described_class) }
    end

    context 'with Sp. as the species' do
      let(:name) { TaxonomySplitter::Name.new('Magnolia Sp.') }

      it { is_expected.to be_an_instance_of(described_class) }
    end

    context 'with sp. as the species' do
      let(:name) { TaxonomySplitter::Name.new('Magnolia sp.') }

      it { is_expected.to be_an_instance_of(described_class) }
    end

    context 'with no species' do
      let(:name) { TaxonomySplitter::Name.new('Cotoneaster') }

      it { is_expected.to be_an_instance_of(described_class) }
    end

    context 'with a regular name' do
      let(:name) { TaxonomySplitter::Name.new('Abeis grandis') }

      it { is_expected.to be_nil }
    end
  end

  describe '#call' do
    subject { described_class.create(name).call }

    context 'with a unk species' do
      let(:name) { TaxonomySplitter::Name.new('Aesculus unk species') }

      it { is_expected.to eq({ genus: 'Aesculus', species: 'UNKNOWN' }) }
    end

    context 'with Sp. as the species' do
      let(:name) { TaxonomySplitter::Name.new('Magnolia Sp.') }

      it { is_expected.to eq({ genus: 'Magnolia', species: 'UNKNOWN' }) }
    end

    context 'with sp. as the species' do
      let(:name) { TaxonomySplitter::Name.new('Magnolia sp.') }

      it { is_expected.to eq({ genus: 'Magnolia', species: 'UNKNOWN' }) }
    end

    context 'with no species' do
      let(:name) { TaxonomySplitter::Name.new('Cotoneaster') }

      it { is_expected.to eq({ genus: 'Cotoneaster', species: 'UNKNOWN' }) }
    end
  end
end
