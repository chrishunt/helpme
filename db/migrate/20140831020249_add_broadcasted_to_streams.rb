class AddBroadcastedToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :broadcasted, :boolean, :default => false
  end
end
