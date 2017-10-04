
class Api::V1::Merchants::SearchController < ApplicationController

  def index
    # binding.pry
    render json: Merchant.where(search_params)
  end

  def show
    # binding.pry
    render json: Merchant.find_by(search_params)
  end

  def rand
    render json: randomize(Merchant)
  end


  private

  def search_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end