class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :identifier
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
