# frozen_string_literal: true

OpenAI.configure do |config|
  config.access_token =  Rails.application.secrets.openai[:access_token]
  config.organization_id = Rails.application.secrets.openai[:organization_id]
end
