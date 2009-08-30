class DatasetData < ActiveRecord::Base
  belongs_to :dataset
  belongs_to :dataset_field
end
