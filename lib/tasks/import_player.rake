# frozen_string_literal: true

namespace :players do
  desc 'Import Players from RealFevr endpoint'

  task create_players: [:environment] do
    ImportPlayersWorker.perform_async
  end
end
