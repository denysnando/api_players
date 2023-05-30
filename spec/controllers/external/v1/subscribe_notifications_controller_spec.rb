# frozen_string_literal: true

require 'rails_helper'

RSpec.describe External::V1::SubscribeNotificationsController do
  let(:player) { create(:player) }

  describe '#players' do
    before do
      create_list(:player, 5)
    end

    it 'returns a player list' do
      get :players

      resp = response.parsed_body

      expect(resp['players']).not_to be_empty
      expect(resp['players'].count).to eq(5)
    end
  end

  describe '#subscribe' do
    let(:params) { nil }
    let(:do_request) { post :subscribe, params: }

    context 'with a valid params' do
      let(:params) do
        {
          subscribe_notification: {
            player_id: player.id,
            email: Faker::Internet.email
          }
        }
      end

      it 'creates a subscribe notification' do
        expect { do_request }.to change(SubscribeNotification, :count).by(1)

        expect(do_request).to have_http_status(:created)
        expect(response.parsed_body['subscribe']).to be_present
        expect(response.parsed_body['message']).to eq('Successfully Subscribed')
      end
    end

    context 'with a invalid params' do
      let(:params) do
        {
          subscribe_notification: {
            email: 'a@a'
          }
        }
      end

      it 'list of errors' do
        expect(do_request).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body['errors']).to contain_exactly('Email is invalid', 'Player must exist')

        expect(StandardError).to be_present
      end
    end
  end
end
