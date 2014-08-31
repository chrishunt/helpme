class AddSlugToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :slug, :string, :nil => false
    add_index :subscriptions, :slug
  end
end
