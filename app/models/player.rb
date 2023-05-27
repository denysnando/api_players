# frozen_string_literal: true

class Player < ApplicationRecord
  # Validations
  validates :name, :nationality, :position, presence: true
end
