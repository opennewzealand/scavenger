class DatasetEntity < ActiveRecord::Base
  has_many :dataset_datas
  belongs_to :dataset
  
  #TODO accessors for each data field, dynamically generated
end
