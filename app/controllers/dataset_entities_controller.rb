class DatasetEntitiesController < ApplicationController
  def index
    @dataset_entities = DatasetEntity.all
    
    respond_to do |format|
      format.json {render :json => @dataset_entities.to_json, :callback => params[:callback] }
      format.html
    end
  end
  
  def show
    @dataset_entity = DatasetEntity.find(params[:id])
    
    respond_to do |format|
      format.json {render :json => @dataset_entity.json, :callback => params[:callback] }
      format.html
    end    
  end

end
