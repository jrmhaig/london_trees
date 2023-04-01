# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Boroughs' do
  describe 'GET /index' do
    context 'with 3 boroughs' do
      before do
        b1 = create(:borough, name: 'Borough One')
        create_list(:tree, 5, borough: b1)
        b2 = create(:borough, name: 'Borough Two')
        create_list(:tree, 3, borough: b2)
        b3 = create(:borough, name: 'Borough Three')
        create_list(:tree, 9, borough: b3)

        get '/boroughs'
      end

      it do
        expect(response.parsed_body['data']).to contain_exactly(
          { 'borough' => 'Borough One', 'trees' => 5 },
          { 'borough' => 'Borough Two', 'trees' => 3 },
          { 'borough' => 'Borough Three', 'trees' => 9 }
        )
      end
    end
  end
end
