# frozen_string_literal: true

require 'virtus'

module RealFevr
  class Player
    include Virtus.model

    attribute :name, String
    attribute :number, String
    attribute :nationality, String
    attribute :birthdate, String
    attribute :position, String
    attribute :age, Integer

    def birthdate=(birthdate)
      birthday = birthdate.to_date
      ages = Date.today.year - birthday.year
      ages -= 1 if Date.today < birthday + ages.years

      super ages || birthdate
    end
  end
end
