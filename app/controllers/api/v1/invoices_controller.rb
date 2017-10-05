module Api # a more common namespacing technique (as opposed to scope resolution ops)
  module V1
    class InvoicesController < ApplicationController

      def index
        render json: Invoice.all
      end

      def show
        render json: Invoice.find(params[:id])
      end

    end
  end
end
