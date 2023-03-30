# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Trees' do
  describe 'GET /index' do
    context 'with 3 trees' do
      before do
        create_list(:tree, 3)

        get '/trees'
      end

      it { expect(response.parsed_body).to be_a(Hash) }
      it { expect(response.parsed_body['data'].length).to eq(3) }
      it { expect(response.parsed_body['pagination']['page']).to eq(1) }
      it { expect(response.parsed_body['pagination']['count']).to eq(3) }
    end

    context 'with 10 trees' do
      before do
        create_list(:tree, 10)

        get '/trees'
      end

      it { expect(response.parsed_body).to be_an(Hash) }
      it { expect(response.parsed_body['data'].length).to eq(10) }
      it { expect(response.parsed_body['pagination']['page']).to eq(1) }
      it { expect(response.parsed_body['pagination']['count']).to eq(10) }
    end

    context 'with more than 10 trees' do
      before do
        create_list(:tree, 37)

        get '/trees'
      end

      it { expect(response.parsed_body).to be_an(Hash) }
      it { expect(response.parsed_body['data'].length).to eq(10) }
      it { expect(response.parsed_body['pagination']['page']).to eq(1) }
      it { expect(response.parsed_body['pagination']['count']).to eq(37) }
      it { expect(response.parsed_body['pagination']['next_url']).to match(%r{/trees.*\?.*page=2}) }
    end

    context 'with an items parameter' do
      before do
        create_list(:tree, 16)

        get '/trees', params: { items: 15 }
      end

      it { expect(response.parsed_body).to be_an(Hash) }
      it { expect(response.parsed_body['data'].length).to eq(15) }
      it { expect(response.parsed_body['pagination']['page']).to eq(1) }
      it { expect(response.parsed_body['pagination']['count']).to eq(16) }
      it { expect(response.parsed_body['pagination']['next_url']).to match(%r{/trees.*\?.*page=2}) }
    end

    context 'with a page parameter' do
      let(:wrong_species) { create(:species, name: 'Wrong') }
      let(:correct_species) { create(:species, name: 'Correct') }

      before do
        create_list(:tree, 20, species: wrong_species)
        create_list(:tree, 10, species: correct_species)
        create_list(:tree, 20, species: wrong_species)

        get '/trees', params: { page: 3 }
      end

      it { expect(response.parsed_body).to be_an(Hash) }
      it { expect(response.parsed_body['data'].length).to eq(10) }
      it { expect(response.parsed_body['pagination']['page']).to eq(3) }
      it { expect(response.parsed_body['pagination']['count']).to eq(50) }
      it { expect(response.parsed_body['data'].pluck('species').uniq).to contain_exactly('Correct') }
      it { expect(response.parsed_body['pagination']['next_url']).to match(%r{/trees.*\?.*page=4}) }
    end
  end
end
