class Content < ActiveRecord::Base
  mount_uploader :file, FileUploader
  module Kind
    Text = 0
    Image = 1
  end
end
