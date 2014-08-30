class AddIndexToSlug < ActiveRecord::Migration
  def change
    add_index :streams, :slug
  end
end
