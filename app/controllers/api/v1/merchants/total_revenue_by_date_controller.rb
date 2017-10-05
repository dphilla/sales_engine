
class Api::V1::Merchants::TotalRevenueByDateController < ApplicationController

  def show
    render json: Merchant.total_revenue_by_date(search_params[:date])
  end

  private

  def search_params
    params.permit(:date)
  end

end

