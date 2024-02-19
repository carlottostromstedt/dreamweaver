# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'
# NOTE: require 'devise' after require 'rspec/rails'
require 'devise'

RSpec.describe 'Stories', type: :request do
  describe 'GET #index' do
    let(:user) { create(:user) }

    it 'returns a 302 response' do
      get storytime_path
      expect(response).to have_http_status(302)
    end

    it 'returns a success response' do
      sign_in user
      get storytime_path
      expect(response).to have_http_status(:success)
    end
  end
end
