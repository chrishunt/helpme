class CreateStream < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.string :slug
      t.text :comments
      t.timestamps
    end
  end
end
