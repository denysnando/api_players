# frozen_string_literal: true

require 'virtus'

module RealFevr
  class ConsumeData
    include Virtus.model

    attribute :teams, Array[RealFevr::Team]
  end
end
