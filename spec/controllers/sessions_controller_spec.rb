require 'spec_helper'

describe SessionsController do
  let(:password) { "sakuratrick" }
  let(:user) { FactoryGirl.create(:user, name: "osa_k", password: "75fc1350db1b0c82e56d34603c79718b6c804c04") }

  describe "#create" do
    it "logins" do
      post :create, name: user.name, password: password
      expect(flash[:notice]).to eq("Logged in as osa_k")
      expect(session[:user_id]).to eq(user.id)
    end

    it "denies login" do
      post :create, name: "hoge", password: "hoge"
      expect(flash[:notice]).to eq("Login failed")
      expect(session[:user_id]).to be_nil
    end
  end

  describe "#destroy" do
    before do
      post :create, name: user.name, password: password
    end

    it "logouts" do
      get :destroy
      expect(session[:user_id]).to be_nil
    end
  end
end
