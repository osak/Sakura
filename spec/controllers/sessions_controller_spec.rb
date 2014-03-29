require 'spec_helper'

describe SessionsController do
  describe "#login" do
    it "logins" do
      expect do
        visit login_path(:twitter)
      end.to change{User.count}.by 1
      expect(User.last.provider).to eq("twitter")
      expect(User.last.uid).to eq("12345")
      expect(User.last.name).to eq("osa_k")
    end
  end

  describe "#logout" do
    before do
      visit login_path(:twitter)
    end

    it "logouts" do
      visit logout_path
      expect(session[:user_id]).to be_nil
    end
  end
end
