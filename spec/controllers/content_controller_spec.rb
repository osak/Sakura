require 'spec_helper'

describe ContentsController do
  let(:text_file) { fixture_file_upload("files/test.txt", "text/plain") }
  let(:image_file) { fixture_file_upload("files/test.jpg", "image/jpeg") }

  context('#upload') do
    let(:name){ "sakuratrick" }

    it "disallow upload by non priviledged user" do
      post :upload, content: {name: name, file: text_file}
      expect(response).to be_redirect
      expect(flash[:error]).to eq("Unauthorized")
    end

    context('logged in correctly') do
      let(:user) { FactoryGirl.create(:user, can_upload: true) }
      before do
        session[:user_id] = user.id
      end

      it "create new content from uploaded file" do
        expect do
          post :upload, content: {name: name, file: text_file}
        end.to change{Content.count}.by 1
        expect(response).to be_redirect
        expect(Content.last.name).to eq(name)
        expect(Content.last.size).to eq(text_file.size)
        expect(Content.last.kind).to eq(Content::Kind::Text)
      end

      it "create new content from uploaded file with default name" do
        expect do
          post :upload, content: {file: text_file}
        end.to change{Content.count}.by 1
        expect(Content.last.name).to eq("test.txt")
      end

      it "distinguish image from other kind of files" do
        expect do
          post :upload, content: {file: image_file}
        end.to change{Content.count}.by 1
        expect(Content.last.kind).to eq(Content::Kind::Image)
      end
    end
  end

  context("#show") do
    let(:text) { FactoryGirl.create(:content, file: text_file) }
    let(:image) { FactoryGirl.create(:content, file: image_file) }

    render_views
    it "render text template for text file" do
      get :show, id: text.id
      assert_select 'blockquote'
    end

    render_views
    it "render image template for image file" do
      get :show, id: image.id
      assert_select 'img'
    end
  end
end
