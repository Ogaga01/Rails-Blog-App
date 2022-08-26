require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should include "Number of posts" on the screen' do
      expect(response.body).to include('Number of posts: 0')
    end
  end

  describe 'GET #show' do
    before(:example) { get user_path(2) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'should include "Here the details of a user: Always and forever' do
      expect(response.body).to include('Always and forever')
    end
  end
end
