require 'spec_helper'

describe HomeController do
  describe '#index' do
    it 'assigns recent contents to @contents in ascending order' do
      c1 = FactoryGirl.create(:content)
      FactoryGirl.create(:content, created_at: c1.created_at - 1.day)

      get :index
      contents = assigns :contents
      expect(contents.size).to eq(2)
      expect(contents[0].created_at).to be > contents[1].created_at
    end
  end
end
