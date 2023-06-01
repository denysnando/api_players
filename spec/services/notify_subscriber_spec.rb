# frozen_string_literal: true

require 'rails_helper'

describe NotifySubscriber do
  let(:player) { create(:player) }
  let(:player_2) { create(:player) }
  let(:notification) { create(:notification, player:) }
  let(:notification_without_email) { create(:notification, player: player_2) }

  describe '#call' do
    before { create(:subscribe_notification, player:) }

    it 'send email with notification' do
      awnser = described_class.call(notification:)

      expect(awnser).to eq(notification)

      # TODO: test email notification
    end

    it 'send email with notification without email' do
      awnser = described_class.call(notification: notification_without_email)

      expect(awnser).to be_blank
    end
  end
end
