class Api::V1::Invoices::MerchantController < ApplicationController


  def index
    invoice = Invoice.find(params[:invoice_id])
    render json: invoice.merchant
  end



end


