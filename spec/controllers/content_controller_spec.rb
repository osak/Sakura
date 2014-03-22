require 'spec_helper'

describe ContentsController do
  context('#upload') do
    let(:name){ "sakuratrick" }

    it "create new content from uploaded file" do
      file = fixture_file_upload("files/test.txt", "text/plain")
      expect do
        post :upload, content: {name: name, file: file}
      end.to change{Content.count}.by 1
      expect(response).to be_redirect
      expect(Content.last.name).to eq(name)
      expect(Content.last.size).to eq(file.size)
      expect(Content.last.kind).to eq(Content::Kind::Text)
    end

    it "create new content from uploaded file with default name" do
      file = fixture_file_upload("files/test.txt", "text/plain")
      expect do
        post :upload, content: {file: file}
      end.to change{Content.count}.by 1
      expect(Content.last.name).to eq("test.txt")
    end

    it "distinguish image from other kind of files" do
      file = fixture_file_upload("files/test.jpg", "image/jpeg")
      expect do
        post :upload, content: {file: file}
      end.to change{Content.count}.by 1
      expect(Content.last.kind).to eq(Content::Kind::Image)
    end
  end
end
