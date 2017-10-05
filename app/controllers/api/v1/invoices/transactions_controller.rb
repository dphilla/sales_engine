class Api::V1::Invoices::TransactionsController < ApplicationController


  def index
    invoice = Invoice.find(params[:invoice_id])
    render json: invoice.transactions.all
  end



end

