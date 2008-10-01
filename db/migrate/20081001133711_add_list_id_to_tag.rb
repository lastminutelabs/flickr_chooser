class AddListIdToTag < ActiveRecord::Migration
  def self.up
    add_column :tags, :list_id, :integer
  end

  def self.down
    remove_column :tags, :list_id
  end
end
