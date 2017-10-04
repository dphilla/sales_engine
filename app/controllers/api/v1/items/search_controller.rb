
class Api::V1::Items::SearchController < ApplicationController

  def show
    if search_params["unit_price"]
      render json: Item.find_one_by_unit_price(search_params)
    else
      render json: Item.find_by(search_params)
    end
  end

  def index
    if search_params["unit_price"]
      render json: Item.find_all_by_unit_price(search_params)
    else
      render json: Item.where(search_params)
    end 
  end

  private

  def search_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

end
