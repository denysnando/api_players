# frozen_string_literal: true

class DestroyOldNotificationsWorker
  include Sidekiq::Worker

  # use the scope old_notifications_to_delete to find old notifications and delete
  def perform
    Notification.old_notifications_to_delete.destroy_all
  end
end
