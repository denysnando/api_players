# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RealFevr::Team do
  let(:team_params) do
      {
        name: 'Belenenses',
        acronym: 'BFS',
        players: [
          {
            name: 'Filipe Mendes',
            number: nil,
            nationality: 'Portugal',
            birthdate: '1985-06-17',
            position: 'G'
          },
          {
            name: 'André Geraldes',
            number: 28,
            nationality: 'Portugal',
            birthdate: '1991-05-02',
            position: 'D'
          },
        ]
      }
  end

  let(:subject) { described_class.new(team_params) }

  describe 'when using the initializer' do
    it 'instantiate all the model fields' do
      expect(subject.players.count).to eq(2)
    end
  end
end
