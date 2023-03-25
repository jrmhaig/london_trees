# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaxonomySplitter::Regular do
  describe '.create' do
    subject { described_class.create(name) }

    context 'with a regular name' do
      let(:name) { TaxonomySplitter::Name.new('Abeis grandis') }

      it { is_expected.to be_an_instance_of(described_class) }
    end
  end

  describe '#call' do
    subject { described_class.create(name).call }

    context 'with a regular name' do
      let(:name) { TaxonomySplitter::Name.new('Abeis grandis') }

      it { is_expected.to eq({ genus: 'Abeis', species: 'Grandis' }) }
    end
  end
end
