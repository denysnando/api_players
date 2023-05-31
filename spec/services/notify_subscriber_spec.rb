# frozen_string_literal: true

require 'rails_helper'

describe NotifySubscriber do
  let(:player) { create(:player) }
  let(:notification) { create(:notification, player:) }

  describe '#call' do
    before { create(:subscribe_notification, player:) }

    it 'send email with notification' do
      awnser = described_class.call(notification:)

      expect(awnser).to eq(notification)

      # TODO: test email notification
    end
  end
end
