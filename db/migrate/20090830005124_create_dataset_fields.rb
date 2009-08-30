class CreateDatasetFields < ActiveRecord::Migration
  def self.up
    create_table :dataset_fields do |t|
      t.string :name
      t.text :css
      t.string :data_type
      t.integer :dataset_id

      t.timestamps
    end
  end

  def self.down
    drop_table :dataset_fields
  end
end
