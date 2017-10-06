
class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    # render json: Customer.favorite_merchant(params[:id])
    render json: Customer.find(params[:id]).favorite_merchant
  end


  private

  def search_params
    params.permit(:id)
  end
end
