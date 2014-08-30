class AddOpentokIdToStream < ActiveRecord::Migration
  def change
    add_column :streams, :opentok_id, :string, :nil => false
  end
end
