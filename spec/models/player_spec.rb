# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player do
  describe 'associations' do
    it { is_expected.to have_many(:notifications) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:nationality) }
    it { is_expected.to validate_presence_of(:position) }
  end
end
