# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :companies
  devise_for :employees
end
