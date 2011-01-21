class AddFeaturedToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :featured, :boolean, :default => false
  end

  def self.down
    remove_column :listings, :featured
  end
end

