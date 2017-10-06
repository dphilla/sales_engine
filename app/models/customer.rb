class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices

  

    def favorite_merchant
     Merchant.select("merchants.*, count('transactions.result')")
        .joins(invoices: [:transactions])
        .merge(Transaction.successful)
        .where('invoices.customer_id = ?', self.id)
        .group(:id)
        .order("count DESC")
        .limit(1)[0]
    end
end
