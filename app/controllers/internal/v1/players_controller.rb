# frozen_string_literal: true

module Internal
  module V1
    class PlayersController < ApplicationController
      def index
        players = Player.all

        render status: :ok, json: { players: Internal::PlayersSerializer.new(players).to_h }
      end

      def create
        player = Player.new(player_params)

        if player.save
          render status: :ok, json: { player: Internal::PlayersSerializer.new(player).to_h }
        else
          render status: :unprocessable_entity, json: { errors: player.errors.full_messages }
        end
      end

      private

      def player_params
        params.require(:player).permit(:name, :age, :nationality, :number, :position)
      end
    end
  end
end
