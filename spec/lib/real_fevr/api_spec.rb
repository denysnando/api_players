# frozen_string_literal: true

require 'rails_helper'
require 'vcr'

RSpec.describe RealFevr::Api do
  let(:subject) { described_class.import }

  describe 'when call import players' do
    it 'returns parsed team and players' do
      VCR.use_cassette("real_api/players", :record => :new_episodes) do
        response = subject

        expect(response.teams.count).to eq(18)
        expect(response.teams.first.players.count).to eq(27)
      end
    end
  end
end
