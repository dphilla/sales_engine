class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def self.favorite_customer(id)
    joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .where(invoices: {merchant_id: "#{id}"})
    .group('customers.id')
    .order('count(transactions) DESC')
    .first
  end

  

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
