# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :internal do
    namespace :v1 do
      resources :players
      resources :notifications
    end
  end
  namespace :external do
    namespace :v1 do
      post 'subscribe', to: 'subscribe_notifications#subscribe'
      get 'players', to: 'subscribe_notifications#players'
    end
  end
end
