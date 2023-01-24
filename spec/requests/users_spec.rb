require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Get index route of users controller' do
    it 'returns http success' do
      get '/users/'
      expect(response).to have_http_status(:success)
    end

    it 'Renders the right template index' do
      get '/'
      expect(response).to render_template(:index)
    end
  end

  describe 'Rendering the show page for the show routes' do
    before :each do
      get '/users/:id'
    end

    it 'Returns success status for show routes' do
      expect(response).to have_http_status(:success)
    end

    it 'Returns or renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'Ensures the response body includes the correct placeholder text' do
      expect(response.body).to include('Welcome to user index page')
    end
  end
end
