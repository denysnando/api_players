# frozen_string_literal: true

class NotifySubscriberWorker
  include Sidekiq::Worker

  def perform(notification_id)
    notification = Notification.find(notification_id)

    NotifySubscriber.call(notification:)
  end
end
