# frozen_string_literal: true

require 'rails_helper'

describe NotifySubscriberWorker do
  let!(:notification) { create(:notification) }

  describe '#perform' do
    it 'expect send notify_sybscriber::call' do
      expect(NotifySubscriber).to receive(:call).and_return(notification)

      described_class.perform_sync(notification.id)
    end
  end
end
