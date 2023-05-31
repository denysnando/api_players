# frozen_string_literal: true

class ImportPlayers
  def self.call(**args)
    new(**args).call
  end

  def initialize(team:)
    @team = team
  end

  def call
    Rails.logger.debug { "Import team players #{team.name}" }

    team.players.each do |player|
      Player.find_or_create_by(
        name: player.name,
        number: player.number,
        nationality: player.nationality,
        age: player.age,
        position: player.position
      )
    end
  end

  private

  attr_reader :team
end
