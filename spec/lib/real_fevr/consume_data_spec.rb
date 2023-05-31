# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RealFevr::ConsumeData do
  let(:consume_params) do
      {
        teams: [
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
        ]
      }
  end

  let(:subject) { described_class.new(consume_params) }

  describe 'when using the initializer' do
    it 'instantiate all the model fields' do
      expect(subject.teams.count).to eq(1)
    end
  end
end
