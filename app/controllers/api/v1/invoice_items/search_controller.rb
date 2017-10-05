
class Api::V1::InvoiceItems::SearchController < ApplicationController

  def index
    if search_params["unit_price"]
      render json: InvoiceItem.find_all_by_unit_price(search_params)
    else
      render json: InvoiceItem.where(search_params)
    end
  end

  def show
    if search_params["unit_price"]
      render json: InvoiceItem.find_one_by_unit_price(search_params)
    else
      render json: InvoiceItem.find_by(search_params)
    end 
  end

  private

  def search_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end


end
