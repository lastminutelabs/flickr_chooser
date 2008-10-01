class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer :tag_id
      t.string :flickr_id

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
