# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaxonomySplitter do
  subject(:splitter) { described_class.new(taxon_name) }

  describe '#call' do
    subject { splitter.call }

    context 'with a normal, two word taxon name' do
      let(:taxon_name) { 'Abeis grandis' }

      it { is_expected.to eq({ genus: 'Abeis', species: 'Grandis' }) }
    end

    context 'with a taxon names starting Zz' do
      let(:taxon_name) { 'Zz tree pit capped' }

      it { is_expected.to eq({ genus: 'UNKNOWN', species: 'UNKNOWN' }) }
    end

    context 'with "unk species"' do
      let(:taxon_name) { 'Aesculus unk species' }

      it { is_expected.to eq({ genus: 'Aesculus', species: 'UNKNOWN' }) }
    end

    context 'with a blank taxon name' do
      let(:taxon_name) { '' }

      it { is_expected.to eq({ genus: 'UNKNOWN', species: 'UNKNOWN' }) }
    end

    context 'with a crossbreed species' do
      let(:taxon_name) { 'Acer x freemanii' }

      it { is_expected.to eq({ genus: 'Acer', species: 'x Freemanii' }) }
    end

    context 'with "Sp." as the species' do
      let(:taxon_name) { 'Magnolia sp.' }

      it { is_expected.to eq({ genus: 'Magnolia', species: 'UNKNOWN' }) }
    end

    context 'with no species' do
      let(:taxon_name) { 'Cotoneaster' }

      it { is_expected.to eq({ genus: 'Cotoneaster', species: 'UNKNOWN' }) }
    end
  end
end
