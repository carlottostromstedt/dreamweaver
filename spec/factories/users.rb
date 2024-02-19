# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'test@dreamweaver.com' }
    password { 'test123+' }
    password_confirmation { 'test123+' }
  end
end
