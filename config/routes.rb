# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :courses
  resources :users, only: %i[index edit show update]
  get 'home/activity'
  root 'home#index'
end
