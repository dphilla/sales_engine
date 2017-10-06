class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items



  def self.find_one_by_unit_price(unit_price_params)
    unit_price_params["unit_price"] = (unit_price_params["unit_price"].to_f * 100).round
    find_by(unit_price_params)
  end

  def self.find_all_by_unit_price(unit_price_params)
    unit_price_params["unit_price"] = (unit_price_params["unit_price"].to_f * 100).round
    where(unit_price_params)
  end

  def self.default_scope
    order(:id)
  end

  def self.top_items_by_revenue(quantity=nil)
    unscoped.select("items.*, sum(invoice_items.unit_price * invoice_items.quantity) AS total_revenue")
    .joins(invoices: [:transactions])
    .merge(Transaction.successful)
    .group(:id)
    .order("total_revenue DESC")
    .limit(quantity)
  end

  def self.most_items(quantity=nil)
    unscoped.joins(invoices: [:transactions])
    .merge(Transaction.successful)
    .group(:id)
    .order("sum(quantity) DESC")
    .limit(quantity)
  end
end
