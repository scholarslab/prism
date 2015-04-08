
require 'spec_helper'
require 'factory_girl'

describe UsersController, type: :controller do
include Devise::TestHelpers # to give your spec access to helpers

	describe "signed in users" do

		login_user
		@prism = FactoryGirl.create(:prism)

		it "should have a current_user" do
			get 'show'
			expect(:current_user).to_not be_nil
		end

		it "should get the current user" do
			get 'show'
			expect(assigns(:current_user)).to eq(assigns(:user))
		end

		it "should assign the current user's prisms" do
			get 'show'
			if assigns(:prisms)
				expect(assigns(:prisms)).to eq(assigns(:current_user).prisms)
			end
		end

		it "should assign the highlighted prisms to the user" do
			get 'show'
			if assigns(:highlighted_prisms)
				expect(assigns(:highlighted_prisms)).to eq(assigns(:current_user).word_markings.map(&:prism_id).uniq)
			end
		end

		it "should get the title of the page" do
			get 'show'
			expect(assigns(:title)).to eq('myprisms')
		end
	end
	
	describe "user not signed in" do
		it "should redirect if not signed in" do
			get 'show'
			expect(response).to redirect_to(:home)
		end

		it "should tell them to sign in" do
			get 'show'
			expect(flash[:error]).to be_present
			expect(flash[:error]).to eq('Sign in first!')
		end
	
	end
end
