require 'spec_helper'

describe ApplicationHelper do
  describe "user_can_upload?" do
    context "Not logged in" do
      it { expect(helper.user_can_upload?).to be_false }
    end

    context "Logged in with uploadable user" do
      let(:user) { FactoryGirl.create(:user, can_upload: true) }
      before do
        assign(:current_user, user)
      end
      it { expect(helper.user_can_upload?).to be_true }
    end

    context "Logged in with non-uploadable user" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        assign(:current_user, user)
      end
      it { expect(helper.user_can_upload?).to be_false }
    end
  end
end
