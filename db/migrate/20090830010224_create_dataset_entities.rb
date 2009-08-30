class CreateDatasetEntities < ActiveRecord::Migration
  def self.up
    create_table :dataset_entities do |t|
      t.string :name
      t.integer :dataset_id

      t.timestamps
    end
  end

  def self.down
    drop_table :dataset_entities
  end
end
