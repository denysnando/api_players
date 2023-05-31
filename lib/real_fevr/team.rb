# frozen_string_literal: true

require 'virtus'

module RealFevr
  class Team
    include Virtus.model

    attribute :name, String
    attribute :acronym, String
    attribute :players, Array[RealFevr::Player]
  end
end
