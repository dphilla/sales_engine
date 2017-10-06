class Api::V1::Merchants::TotalRevenueByMerchantController < ApplicationController

  def show
    if params[:date]
      raw_number = Merchant.total_revenue_by_date_with_id(params[:date], params[:merchant_id])
    else
      raw_number = Merchant.total_revenue_for_merchant(params[:merchant_id])
    end
    render json: format_revenue_raw(raw_number)
  end

  private

  def search_params
    params.permit(:date)
  end

end


