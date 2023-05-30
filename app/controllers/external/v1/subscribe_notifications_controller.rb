# frozen_string_literal: true

module External
  module V1
    class SubscribeNotificationsController < ApplicationController
      before_action :find_player, only: %i[show update]

      def players
        players = Player.all

        render status: :ok, json: { players: Internal::PlayersSerializer.new(players).to_h }
      end

      def subscribe
        subscribe = SubscribeNotification.new(subscribe_notification_params)

        if subscribe.save
          render status: :created, json:
            { subscribe: External::SubscribeNotificationsSerializer.new(subscribe).to_h,
              message: I18n.t('subscribe_notifications.success') }
        else
          render status: :unprocessable_entity, json: { errors: subscribe.errors.full_messages }
        end
      end

      private

      def subscribe_notification_params
        params.require(:subscribe_notification).permit(:player_id, :email)
      end
    end
  end
end
