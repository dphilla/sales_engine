
class Api::V1::Merchants::TotalRevenueByDateController < ApplicationController

  def show
    raw_number = Merchant.total_revenue_by_date(search_params[:date])
    render json: format_raw(raw_number)
  end

  private

  def search_params
    params.permit(:date)
  end

end

