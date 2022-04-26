require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before :each do
      get '/users/1/posts'
    end

    it 'should respond to the correct http status' do
      expect(response.status).to eq(200)
    end

    it 'should render the correct resource template' do
      expect(response).to render_template(:index)
    end

    it 'should respond to the correct body placeholder text' do
      expect(response.body).to include('Posts Index Page')
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/1/posts/1'
    end

    it 'should respond to the correct http status' do
      expect(response.status).to eq(200)
    end

    it 'should render the correct resource template' do
      expect(response).to render_template(:show)
    end

    it 'should respond to the correct body placeholder text' do
      expect(response.body).to include('Posts Show Page')
    end
  end
end
