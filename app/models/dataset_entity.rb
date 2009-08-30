require 'open-uri'

class DatasetEntity < ActiveRecord::Base
  has_many :dataset_datas
  belongs_to :dataset
  
  #TODO accessors for each data field, dynamically generated
  def json
    fields = dataset.dataset_fields
    e_doc = Hpricot(open(url))
    data = {"id"=> id, "url"=> url }
    fields.each do |field|
      p field
      data[field.name] = (e_doc/field.css).text.strip
    end
    puts data.inspect 
    
    data   
  end
end
