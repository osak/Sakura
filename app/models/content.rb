class Content < ActiveRecord::Base
  mount_uploader :file, FileUploader
  belongs_to :owner, class_name: 'User'

  module Kind
    Text = :text
    Image = :image
    Binary = :binary
  end

  def kind
    @kind ||= 
      if not file.content_type.blank?
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
    when /text/
      Kind::Text
    else
      Kind::Binary
    end
  end

  def kind_from_filename(filename)
    case filename
    when /\.(?:jpg|png|gif)\z/
      Kind::Image
    when /\.(?:txt)\z/
      Kind::Text
    else
      Kind::Binary
    end
  end
end
