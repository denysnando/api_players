# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RealFevr::Player do
  let(:player_params) do
      {
        name: 'Filipe Mendes',
        number: nil,
        nationality: 'Portugal',
        birthdate: '1985-06-17',
        position: 'G'
      }
  end

  let(:subject) { described_class.new(player_params) }

  describe 'when using the initializer' do
    it 'instantiate all the model fields' do
      expect( subject.name).to eq('Filipe Mendes')
    end
  end
end
