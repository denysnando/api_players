# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubscribeNotification do
  subject { build(:subscribe_notification) }

  describe 'associations' do
    it { is_expected.to belong_to(:player) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).scoped_to(:player_id).case_insensitive }
    it { is_expected.not_to allow_value('test@test').for(:email) }
    it { is_expected.to allow_value('test@test.com').for(:email) }
  end
end
