# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    name { Faker::Sports::Football.player }
    nationality { Faker::Nation.nationality }
    number { Faker::Number.decimal_part(digits: 2) }
    position { Faker::Sports::Football.position }
    age { Faker::Number.number(digits: 2) }
  end
end
