# frozen_string_literal: true

module Internal
  class NotificationsSerializer < ApplicationSerializer
    attributes :id
    attributes :message

    attribute :player do |object, _params|
      Internal::PlayersSerializer.new(object.player).to_h
    end
  end
end
