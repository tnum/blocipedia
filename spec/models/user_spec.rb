require 'rails_helper'

describe User do

  describe "User roles" do

    before do
      @user = create(:user)
    end

    it "defaults to standard role when first created" do
      expect(@user.role).to eq('standard')
    end
  end
  
end