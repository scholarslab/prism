
require 'spec_helper'
require 'factory_girl'

describe UsersController, type: :controller do
include Devise::TestHelpers # to give your spec access to helpers


	describe "signed in users" do
	
		@current_user = login_user

		it "should have a current_user" do
			expect(assigns(:current_user)).to_not be_nil
		end

		it "should get the current user" do
			expect(assigns(:current_user)).to eq(assigns(:user))
		end

		it "should assign the current user's prisms, highlighted_prisms, title" do
			expect(assigns(:prisms)).to eq(assigns(:current_user).prisms)
		end
	end
	
	describe "user not signed in" do
		it "should redirect if not signed in" do
		end
	end
end
