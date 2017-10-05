class Api::V1::Merchants::MostItemsController < ApplicationController

  def index
    render json: Merchant.top_by_most_items(search_params[:quantity])
  end

  private

  def search_params
    params.permit(:quantity)
  end

end

