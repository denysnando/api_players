# frozen_string_literal: true

class ImportPlayersWorker
  include Sidekiq::Worker

  def perform
    response = RealFevr::Api.import

    response.teams.each do |team|
      ImportPlayers.call(team:)
    end
  end
end
