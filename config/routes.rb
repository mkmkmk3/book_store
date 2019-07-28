# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    # Sidekiqの管理画面
    require 'sidekiq/web'
    mount Sidekiq::Web, at: '/sidekiq'
  end
  match '*path' => 'application#routing_error', via: :all
end
