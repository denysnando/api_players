# frozen_string_literal: true

module Internal
  module V1
    class PlayersController < ApplicationController
      def index
        players = Player.all

        render status: :ok, json: { players: Internal::PlayersSerializer.new(players).to_h }
      end
    end
  end
end
