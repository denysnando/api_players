# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Internal::V1::NotificationsController do
  let(:player) { create(:player) }

  describe '#index' do
    before do
      create_list(:notification, 5)
    end

    it 'returns a notifications list' do
      get :index

      resp = response.parsed_body

      expect(resp['notifications']).not_to be_empty
      expect(resp['notifications'].count).to eq(5)
    end
  end

  describe '#create' do
    let(:params) { nil }
    let(:do_request) { post :create, params: }

    context 'with a valid params' do
      let(:params) do
        {
          notification: {
            player_id: player.id,
            message: Faker::Sports::Football.competition
          }
        }
      end

      it 'creates a notification' do
        expect { do_request }.to change(Notification, :count).by(1)

        expect(do_request).to have_http_status(:created)
        expect(response.parsed_body['notification']).to be_present
        expect(response.parsed_body['notification']['player']).to be_present
      end
    end

    context 'with a invalid params' do
      let(:params) do
        {
          notification: {
            message: Faker::Sports::Football.competition
          }
        }
      end

      it 'list of errors' do
        expect(do_request).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body['errors']).to contain_exactly("Player must exist")

        expect(StandardError).to be_present
      end
    end
  end

  describe '#update' do
    let(:notification) { create(:notification, player: player) }
    let(:params) { nil }
    let(:do_request) { put :update, params: }

    context 'with a valid params' do
      let(:params) do
        {
          id: notification.id,
          notification: {
            message: 'New message notification received'
          }
        }
      end

      it 'updates a notification' do
        expect { do_request }.to change(Notification, :count).by(1)

        expect(do_request).to have_http_status(:success)
        expect(response.parsed_body['notification']).to be_present
        expect(response.parsed_body['notification']['message']).to eq('New message notification received')
        expect(response.parsed_body['notification']['player']['name']).to eq(player.name)
      end
    end

    context 'with a invalid params' do
      let(:params) do
        {
          id: notification.id,
          notification: {
            player_id: nil
          }
        }
      end

      it 'try updates a notification' do
        expect(do_request).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body['errors']).to contain_exactly("Player must exist")

        expect(StandardError).to be_present
      end
    end
  end

  describe '#show' do
    let(:notification) { create(:notification) }
    let(:params) { nil }
    let(:do_request) { get :show, params: }

    context 'with a valid params' do
      let(:params) { { id: notification.id } }

      it 'show the notification' do
        expect(do_request).to have_http_status(:found)
        expect(response.parsed_body['notification']).to be_present
        expect(response.parsed_body['notification']['message']).to eq(notification.message)
      end
    end

    context 'with a invalid params' do
      let(:params) { { id: 'A' } }

      it 'return a error message' do
        expect(do_request).to have_http_status(:not_found)
        expect(response.parsed_body['messages']).to eq('Notification not found')
      end
    end
  end
end
