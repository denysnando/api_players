# frozen_string_literal: true

module Internal
  module V1
    class NotificationsController < ApplicationController
      before_action :find_notification, only: %i[show update]

      def index
        notifications = Notification.all

        render status: :ok, json: { notifications: Internal::NotificationsSerializer.new(notifications).to_h }
      end

      def show
        if @notification
          render status: :found, json: { notification: Internal::NotificationsSerializer.new(@notification).to_h }
        else
          render status: :not_found, json: { messages: I18n.t('notification.not_found') }
        end
      end

      def create
        notification = Notification.new(notification_params)

        if notification.save
          render status: :created, json: { notification: Internal::NotificationsSerializer.new(notification).to_h }
        else
          render status: :unprocessable_entity, json: { errors: notification.errors.full_messages }
        end
      end

      def update
        if @notification.update(notification_params)
          render status: :ok, json: { notification: Internal::NotificationsSerializer.new(@notification).to_h }
        else
          render status: :unprocessable_entity, json: { errors: @notification.errors.full_messages }
        end
      end

      private

      def find_notification
        @notification = Notification.find_by(id: params[:id])
      end

      def notification_params
        params.require(:notification).permit(:player_id, :message)
      end
    end
  end
end
