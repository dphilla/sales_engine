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


end
