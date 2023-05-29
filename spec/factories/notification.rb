# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    player
    message { Faker::Sports::Football.competition }
  end
end
