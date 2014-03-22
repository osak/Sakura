class RemoveKindFromContent < ActiveRecord::Migration
  def change
    remove_column :contents, :kind, :integer
  end
end
