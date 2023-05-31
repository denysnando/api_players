# frozen_string_literal: true

class NotifySubscriber
  attr_reader :notification

  def self.call(**args)
    new(**args).call
  end

  def initialize(notification:)
    @notification = notification
  end

  def call
    return if emails.blank?

    Rails.logger.info("######################################################")
    Rails.logger.info("to: #{emails}")
    Rails.logger.info("Player: #{notification.player.name}")
    Rails.logger.info("Body message: #{notification.message}")
    Rails.logger.info("######################################################")

    # TODO: SubscribeNotificationMailer.with(email:, notification:).news.deliver_later
  end

  private

  def emails
    @emails ||= SubscribeNotification.where(player_id: notification.player)&.map(&:email)
  end
end
