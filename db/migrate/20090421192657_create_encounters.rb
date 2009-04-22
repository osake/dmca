class CreateEncounters < ActiveRecord::Migration
  def self.up
    create_table :encounters do |t|
      t.string :name
      t.integer :experience

      t.timestamps
    end
  end

  def self.down
    drop_table :encounters
  end
end
