# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Internal::V1::PlayersController, type: :controller do
  describe '#index' do
    before do
      FactoryBot.create_list(:player, 5)
    end

    it 'returns a players list' do
      get :index

      resp = JSON.parse(response.body)

      expect(resp['players']).to_not match_array([])
      expect(resp['players'].count).to eq(5)
    end
  end

  describe '#create' do
    let(:params){ nil }
    let(:do_request){ post :create, params: params }

    context 'with a valid params' do
      let(:params) do
        {
          player: {
            name: Faker::Sports::Football.player,
            nationality: Faker::Nation.nationality,
            number: Faker::Number.decimal_part(digits: 2),
            position: Faker::Sports::Football.position,
            age: Faker::Number.number(digits: 2)
          }
        }
      end

      it 'creates a player' do
        expect(do_request).to have_http_status(:success)
        expect(JSON.parse(response.body)["player"].present?).to be_truthy

        expect(Player.count).to eq(1)
      end
    end

    context 'with a invalid params' do
      let(:params) do
        {
          player: {
            name: Faker::Sports::Football.player
          }
        }
      end

      it 'list of errors' do
        expect(do_request).to have_http_status(:unprocessable_entity)

        expect(JSON.parse(response.body).dig('errors')).to match_array(
          ["Nationality can't be blank", "Position can't be blank"]
        )

        expect(StandardError).to be_present
      end
    end
  end
end
