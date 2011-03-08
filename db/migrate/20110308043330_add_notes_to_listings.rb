class AddNotesToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :notes, :text
  end

  def self.down
    remove_column :listings, :notes
  end
end
