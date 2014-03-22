require 'spec_helper'

describe ContentsController do
  context(:upload) do
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
  end
end
