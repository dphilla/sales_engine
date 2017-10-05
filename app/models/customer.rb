class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices

  #
  # def self.favorite_merchant(id)
  #   Merchant.select("merchants.*, count('transactions.result')")
  #     .joins(invoices: [:transactions])
  #     .merge(Transaction.successful)
  #     .where('invoices.customer_id = ?', id)
  #     .group(:id)
  #     .order("count DESC")
  #     .limit(1)
  # end


    def favorite_merchant
    m =   Merchant.select("merchants.*, count('transactions.result')")
        .joins(invoices: [:transactions])
        .merge(Transaction.successful)
        .where('invoices.customer_id = ?', self.id)
        .group(:id)
        .order("count DESC")
        .limit(1)
        m[0]
    end
end
