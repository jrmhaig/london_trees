# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaxonomySplitter::Unknown do
  describe '.create' do
    subject { described_class.create(name) }

    context 'with a zz name' do
      let(:name) { TaxonomySplitter::Name.new('Zz tree pit capped') }

      it { is_expected.to be_an_instance_of(described_class) }
    end

    context 'with a blank name' do
      let(:name) { TaxonomySplitter::Name.new('') }

      it { is_expected.to be_an_instance_of(described_class) }
    end

    context 'with a regular name' do
      let(:name) { TaxonomySplitter::Name.new('Abeis grandis') }

      it { is_expected.to be_nil }
    end
  end

  describe '#call' do
    subject { described_class.create(name).call }

    context 'with a zz name' do
      let(:name) { TaxonomySplitter::Name.new('Zz tree pit capped') }

      it { is_expected.to eq({ genus: 'UNKNOWN', species: 'UNKNOWN' }) }
    end

    context 'with a blank name' do
      let(:name) { TaxonomySplitter::Name.new('') }

      it { is_expected.to eq({ genus: 'UNKNOWN', species: 'UNKNOWN' }) }
    end
  end
end
