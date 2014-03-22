class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name
      t.integer :size
      t.integer :type

      t.timestamps
    end
  end
end
