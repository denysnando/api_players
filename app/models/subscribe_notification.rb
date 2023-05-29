# frozen_string_literal: true

class SubscribeNotification < ApplicationRecord
  # Relationship
  belongs_to :player

  # Validations
  validates :email, presence: true,
                    uniqueness: { scope: :player_id, case_sensitive: false },
                    format: { with: /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i }
end
