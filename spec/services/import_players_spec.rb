# frozen_string_literal: true

require 'rails_helper'

describe ImportPlayers do
  let(:team) do
    OpenStruct.new(
      name: 'Belenenses',
      acronym: 'BFS',
      players: [player]
    )
  end

  let(:player) do
    OpenStruct.new(
      name: 'Filipe Mendes',
      number: nil,
      nationality: 'Portugal',
      birthdate: '1985-06-17',
      position: 'G'
    )
  end

  describe '#call' do
    it 'saves the players' do
      expect { described_class.call(team:) }.to change(Player, :count).by(1)

      expect(Player.last.name).to eq(player.name)
    end
  end
end
