# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'dashboard#dashboard'
  devise_for :companies, controllers: {
    sessions: 'companies/sessions', registrations: 'companies/registrations'
  }
  devise_for :employees, controllers: {
    sessions: 'employees/sessions'
  }
  resources :employees
  resources :videos
  namespace :challenges do
    resources :attempt, only: :show
  end
end

