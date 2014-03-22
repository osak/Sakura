class Content < ActiveRecord::Base
  mount_uploader :file, FileUploader
  module Kind
    Text = :text
    Image = :image
  end

  def kind
    @kind ||= 
      if file.content_type
        kind_from_content_type(file.content_type)
      else
        kind_from_filename(file.filename)
      end
  end

  private

  def kind_from_content_type(str)
    case str
    when /image/
      Kind::Image
    else
      Kind::Text
    end
  end

  def kind_from_filename(filename)
    case filename
    when /\.(?:jpg|png|gif)\z/
      Kind::Image
    else
      Kind::Text
    end
  end
end
