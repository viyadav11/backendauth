require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe 'POST /create' do
    context 'with valid parameters' do
      before do
        post :create, params:
                              {
                                username: 'abcd1',
                                email: 'abcs1@gamil.com',
                                password: '123456',
                              }  
      end
      it 'returns the user name' do
        expect(JSON.parse(response.body)['username']).to eq('abcd1')
      end

      it 'returns the username' do
        expect(JSON.parse(response.body)['email']).to eq('abcs1@gamil.com')
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end  
  end

  # describe 'GET/show' do
  #   before do
  #     byebug
  #     user=User.create(username:"vikas",email:"vikas@gmail.com",password:"1345")
  #     get :show, params: {username:user.username }
  #   end
  #   it 'should hit the show method' do 
  #     expect(JSON.parse(response.body)['username']).to eq('vikas')
  #   end

  # end

  describe 'GET/check' do 
    before do
      # byebug
      user=User.create(username:"vikas",email:"vikas@gmail.com",password:"1345")
      # allow(user).to receive(:authenticate_request)
    end
    it 'render towards the check page' do 
      get :check
      # byebug
      expect(JSON.parse(response)).to eq("check method ahs been hit")
    end
  end

end