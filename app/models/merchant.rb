class Merchant < ApplicationRecord
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items


  def self.top_by_most_revenue(quantity)
    Merchant.joins(invoices: [:transactions, :invoice_items])
            .merge(Transaction.successful)
            .group(:id)
            .order("sum(quantity * unit_price)")
            .limit(quantity) #should add condition for non-nums, etc.
  end

end
