# frozen_string_literal: true

module External
  class SubscribeNotificationsSerializer < ApplicationSerializer
    attributes :email

    attribute :player do |object, _params|
      Internal::PlayersSerializer.new(object.player).to_h
    end
  end
end
