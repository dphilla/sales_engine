class Api::V1::Merchants::TotalRevenueByMerchantController < ApplicationController

  def show
    raw_number = Merchant.total_revenue_for_merchant(params[:merchant_id])
    render json: format_revenue_raw(raw_number)
  end

  private

  def search_params
    params.permit(:id)
  end

end


