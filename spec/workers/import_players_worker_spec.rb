# frozen_string_literal: true

require 'rails_helper'

describe ImportPlayersWorker do
  let(:params) do
    {
      teams: [
        { name: 'Belenenses',
          acronym: 'BFS',
          players: [
            { name: 'Filipe Mendes', number: 'nil',
              nationality: 'Portugal', birthdate: '1985-06-17', position: 'G' },
            { name: 'André Geraldes', number: 28,
              nationality: 'Portugal', birthdate: '1991-05-02', position: 'D' },
            { name: 'Fredy', number: 'nil',
              nationality: 'Angola', birthdate: '1990-03-27', position: 'M' },
            { name: 'Tiago Caeiro', number: 'nil',
              nationality: 'Portugal', birthdate: '1984-03-29', position: 'A' },
            { name: 'Vincent Sasso', number: 'nil',
              nationality: 'France', birthdate: '1991-02-16', position: 'D' }
          ]
        }
      ]
    }
  end
  let(:params_parsed) { JSON.parse(params.to_json, object_class: OpenStruct) }

  describe '#perform' do
    before { allow(RealFevr::Api).to receive(:import).and_return(params_parsed) }

    it 'destroy notifications older than a week' do
      expect(ImportPlayers).to receive(:call).and_return(true)

      described_class.perform_sync
    end
  end
end
