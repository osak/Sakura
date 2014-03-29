require 'spec_helper'

describe Content do
  describe "#kind" do
    context "Text" do
      let(:file) {
        extend ActionDispatch::TestProcess
        fixture_file_upload("files/test.txt", "text/plain")
      }
      let(:file_nomime) {
        extend ActionDispatch::TestProcess
        fixture_file_upload("files/test.txt")
      }
      subject(:content) { FactoryGirl.create(:content, file: file) }
      subject(:content_nomime) { FactoryGirl.create(:content, file: file_nomime) }
      it "is kind of text" do
        expect(content.kind).to eq(Content::Kind::Text)
        expect(content_nomime.kind).to eq(Content::Kind::Text)
      end
    end

    context "Image" do
      let(:file) { 
        extend ActionDispatch::TestProcess
        fixture_file_upload("files/test.jpg", "image/jpeg")
      }
      let(:file_nomime) {
        extend ActionDispatch::TestProcess
        fixture_file_upload("files/test.jpg")
      }
      subject(:content) { FactoryGirl.create(:content, file: file) }
      subject(:content_nomime) { FactoryGirl.create(:content, file: file_nomime) }

      it "is kind of image" do
        expect(content.kind).to eq(Content::Kind::Image)
        expect(content_nomime.kind).to eq(Content::Kind::Image)
      end

    end
  end
end
