# frozen_string_literal: true

class Notification < ApplicationRecord
  # Relationship
  belongs_to :player

  # Validations
  validates :message, presence: true,
                      length: { maximum: 255 },
                      uniqueness: { scope: :player_id, case_sensitive: false }
end
