require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'works! (now write some real specs)' do
      get '/users'
      expect(response).to have_http_status(:sucess)
      expect(response).to render_template(:index)
      expect(response).to include('List of users with post count:')
    end
  end

  describe 'GET /users/:id' do
    it 'returns HttpResponse and renders template' do
      user = User.create(name: 'test user')
      get "/users/#{user.id}"
      expect(response).to have_http_status(:sucess)
      expect(response).to render_template(:show)
      expect(response).to include('User info:')
    end
  end
end
