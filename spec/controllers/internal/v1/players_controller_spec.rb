# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Internal::V1::PlayersController do
  describe '#index' do
    before do
      create_list(:player, 5)
    end

    it 'returns a players list' do
      get :index

      resp = response.parsed_body

      expect(resp['players']).not_to be_empty
      expect(resp['players'].count).to eq(5)
    end
  end

  describe '#create' do
    let(:params) { nil }
    let(:do_request) { post :create, params: }

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
        expect { do_request }.to change(Player, :count).by(1)

        expect(do_request).to have_http_status(:created)
        expect(response.parsed_body['player']).to be_present
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
        expect(response.parsed_body['errors']).to contain_exactly("Nationality can't be blank",
                                                                  "Position can't be blank")

        expect(StandardError).to be_present
      end
    end
  end

  describe '#update' do
    let(:player) { create(:player) }
    let(:params) { nil }
    let(:do_request) { put :update, params: }

    context 'with a valid params' do
      let(:params) do
        {
          id: player.id,
          player: {
            name: 'Denys Picapedra',
            nationality: 'Brasileiro',
            number: '10',
            position: 'AT',
            age: '33'
          }
        }
      end

      it 'updates a player' do
        expect { do_request }.to change(Player, :count).by(1)

        expect(do_request).to have_http_status(:success)
        expect(response.parsed_body['player']).to be_present
        expect(response.parsed_body['player']['name']).to eq('Denys Picapedra')
      end
    end

    context 'with a invalid params' do
      let(:params) do
        {
          id: player.id,
          player: {
            nationality: nil
          }
        }
      end

      it 'updates a player' do
        expect(do_request).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body['errors']).to contain_exactly("Nationality can't be blank")

        expect(StandardError).to be_present
      end
    end
  end

  describe '#show' do
    let(:player) { create(:player) }
    let(:params) { nil }
    let(:do_request) { get :show, params: }

    context 'with a valid params' do
      let(:params) { { id: player.id } }

      it 'show the player' do
        expect(do_request).to have_http_status(:found)
        expect(response.parsed_body['player']).to be_present
        expect(response.parsed_body['player']['name']).to eq(player.name)
      end
    end

    context 'with a invalid params' do
      let(:params) { { id: 'A' } }

      it 'return a error message' do
        expect(do_request).to have_http_status(:not_found)
        expect(response.parsed_body['messages']).to eq('Player not found')
      end
    end
  end
end
