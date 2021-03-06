class Merchant < ApplicationRecord
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items


  def self.top_by_most_revenue(quantity)
            joins(invoices: [:transactions, :invoice_items])
            .merge(Transaction.unscoped.successful)
            .group(:id)
            .order("sum(quantity * unit_price) DESC")
            .limit(quantity) #should add condition for non-nums, etc.
  end

  def self.top_by_most_items(quantity)
     Merchant.joins(invoices: [:transactions, :invoice_items])
            .merge(Transaction.successful)
            .group(:id)
            .order("sum(quantity) DESC")
            .limit(quantity)
  end


  def self.total_revenue_by_date(date=nil)
    joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.unscoped.successful)
    .where(invoices: {created_at: "#{date}"})
    .sum('quantity * unit_price')
  end

  def self.total_revenue_for_merchant(id)
    joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.unscoped.successful)
    .where(invoices: {merchant_id: "#{id}"})
    .sum('quantity * unit_price')
  end

  def self.total_revenue_by_date_with_id(date=nil, id=nil)
    joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.unscoped.successful)
    .where(invoices: {created_at: "#{date}"})
    .where(invoices: {merchant_id: "#{id}"})
    .sum('quantity * unit_price')
  end

  def self.favorite_customer(id)
    joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.unscoped.successful)
    .where(invoices: {customer_id: "#{id}"})
  end


end
