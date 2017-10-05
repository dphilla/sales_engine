class Api::V1::Invoices::ItemsController < ApplicationController


  def index
    invoice = Invoice.find(params[:invoice_id])
    render json: invoice.items.all
  end


end


