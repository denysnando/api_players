# frozen_string_literal: true

require 'rails_helper'

describe DestroyOldNotificationsWorker do
  let!(:notification) { create_list(:notification, 5) }

  describe '#perform' do
    before do
      Notification.update_all(created_at: 2.weeks.ago)

      create(:notification)
    end

    it 'destroy notifications older than a week' do
      expect { described_class.perform_sync }.to change(Notification.all, :count).from(6).to(1)
    end
  end
end
