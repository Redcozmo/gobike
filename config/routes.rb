# frozen_string_literal: true

Rails.application.routes.draw do
  get 'velib_stations/index'
  get 'services/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
