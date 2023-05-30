# frozen_string_literal: true

class Notification < ApplicationRecord
  # Relationship
  belongs_to :player

  # Validations
  validates :message, presence: true,
                      length: { maximum: 255 },
                      uniqueness: { scope: :player_id, case_sensitive: false }
  # Scopes
  scope :old_notifications_to_delete, -> { where('created_at < ?', 1.week.ago) }
end
