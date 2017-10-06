
class Api::V1::Items::TopItemsController < ApplicationController

  def index
    render json: Item.top_items_by_revenue(search_params[:quantity])
  end

  private

  def search_params
    params.permit(:quantity)
  end
end
