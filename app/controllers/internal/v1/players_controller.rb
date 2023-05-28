# frozen_string_literal: true

module Internal
  module V1
    class PlayersController < ApplicationController
      before_action :find_player, only: %i[show update]

      def index
        players = Player.all

        render status: :ok, json: { players: Internal::PlayersSerializer.new(players).to_h }
      end

      def show
        if @player
          render status: :found, json: { player: Internal::PlayersSerializer.new(@player).to_h }
        else
          render status: :not_found, json: { messages: I18n.t('player.not_found') }
        end
      end

      def create
        player = Player.new(player_params)

        if player.save
          render status: :created, json: { player: Internal::PlayersSerializer.new(player).to_h }
        else
          render status: :unprocessable_entity, json: { errors: player.errors.full_messages }
        end
      end

      def update
        if @player.update(player_params)
          render status: :ok, json: { player: Internal::PlayersSerializer.new(@player).to_h }
        else
          render status: :unprocessable_entity, json: { errors: @player.errors.full_messages }
        end
      end

      private

      def find_player
        @player = Player.find_by(id: params[:id])
      end

      def player_params
        params.require(:player).permit(:name, :age, :nationality, :number, :position)
      end
    end
  end
end
