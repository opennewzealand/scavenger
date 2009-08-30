class CreateDatasetDatas < ActiveRecord::Migration
  def self.up
    create_table :dataset_datas do |t|
      t.string :value
      t.integer :dataset_id
      t.integer :dataset_field_id

      t.timestamps
    end
  end

  def self.down
    drop_table :dataset_datas
  end
end
