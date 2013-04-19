module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mapping[:user]
      user = FactoryGirl.create(:user)
      user.confirm!
      sign_in user
    end
  end
end
