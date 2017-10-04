class Merchant < ApplicationRecord
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items


  def self.top_by_revenue(quantity)
    Merchant.find_by_sql("SELECT * FROM merchants
                         INNER JOIN invoices
                         ON merchants.id=merchant_id
                         INNER JOIN... ")
  end
end
