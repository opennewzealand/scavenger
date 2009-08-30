class AddUrlToDatasetEntity < ActiveRecord::Migration
  def self.up
    add_column :dataset_entities, :url, :text
  end

  def self.down
    remove_column :dataset_entities, :url
  end
end
