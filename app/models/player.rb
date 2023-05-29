# frozen_string_literal: true

class Player < ApplicationRecord
  # Relationship
  has_many :notifications

  # Validations
  validates :name, :nationality, :position, presence: true
end
