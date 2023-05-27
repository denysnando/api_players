# frozen_string_literal: true

module Internal
  class PlayersSerializer < ApplicationSerializer
    attributes :id
    attributes :name
    attributes :nationality
    attributes :position
    attributes :number
    attributes :age
  end
end
