class AddCanUploadToUser < ActiveRecord::Migration
  def change
    add_column :users, :can_upload, :boolean
  end
end
