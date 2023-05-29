# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notification do
  subject { build(:notification) }

  describe 'associations' do
    it { is_expected.to belong_to(:player) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:message) }
    it { is_expected.to validate_length_of(:message).is_at_most(255) }
    it { is_expected.to validate_uniqueness_of(:message).scoped_to(:player_id).case_insensitive }
  end
end
