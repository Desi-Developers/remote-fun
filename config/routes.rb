# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'dashboard#dashboard'
  devise_for :companies, controllers: {
    sessions: 'companies/sessions', registrations: 'companies/registrations',
    passwords: 'companies/passwords'
  }
  devise_for :employees, controllers: {
    sessions: 'employees/sessions', passwords: 'employees/passwords'
  }
  resources :employees
  resources :videos
  namespace :challenges do
    resources :attempt, only: :show
  end
  resources :home, only: :index

  resources :dashboard do
    collection do
      get :winners
      get :activities
    end
  end
end

