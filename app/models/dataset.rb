class Dataset < ActiveRecord::Base
  has_many :dataset_fields
  has_many :dataset_datas
  has_many :dataset_entities
end
