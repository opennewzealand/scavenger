class AddDatasetEntityIdToDatasetData < ActiveRecord::Migration
  def self.up
    add_column :dataset_datas, :dataset_entity_id, :integer
  end

  def self.down
    remove_column :dataset_datas, :dataset_entity_id
  end
end
