# frozen_string_literal: true

FactoryBot.define do
  factory :subscribe_notification do
    player
    email { Faker::Internet.email }
  end
end
