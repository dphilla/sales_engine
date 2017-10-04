require 'rake'
require 'csv'


task :import => [:environment] do

Merchant.destroy_all
Transaction.destroy_all
Item.destroy_all
InvoiceItem.destroy_all
Invoice.destroy_all
Customer.destroy_all

merchant_csv = "db/csv/merchants.csv"
transaction_csv = "db/csv/transactions.csv"
item_csv = "db/csv/items.csv"
invoice_item_csv = "db/csv/invoice_items.csv"
invoice_csv = "db/csv/invoices.csv"
customer_csv = "db/csv/customers.csv"

  CSV.foreach(merchant_csv, :headers => true) do |row|
      Merchant.create({
        :name => row[1],
        :created_at => row[2],
        :updated_at => row[3]
      })
    end

  # data = File.read('db/csv/merchants.csv')
  #   csv = CSV.parse(data, :headers => true)
  #   csv.each do |row|
  #     binding.pry
  #     Merchant.create!(row.to_hash)
  #   end

  puts "merchants seeded!"

  CSV.foreach(customer_csv, :headers => true) do |row|
    Customer.create({
      :first_name => row[1],
      :last_name => row[2],
      :created_at => row[3],
      :updated_at => row[4]
    })
  end

  puts "customer seeded!"

  CSV.foreach(invoice_csv, :headers => true) do |row|
    Invoice.create({
      :customer_id => row[1],
      :merchant_id => row[2],
      :status => row[3],
      :created_at => row[4],
      :updated_at => row[5]
    })
  end

  puts "invoice seeded!"

  CSV.foreach(transaction_csv, :headers => true) do |row|
    Transaction.create({
      :invoice_id => row[1],
      :credit_card_number => row[2],
      :result => row[3],
      :created_at => row[4],
      :updated_at => row[5]
    })
  end

puts "transactions seeded!"

  CSV.foreach(item_csv, :headers => true) do |row|
    Item.create({
      :name => row[1],
      :description => row[2],
      :unit_price => row[3],
      :merchant_id => row[4],
      :created_at => row[5],
      :updated_at => row[6]
    })
  end

puts "items seeded!"

  CSV.foreach(invoice_item_csv, :headers => true) do |row|
    InvoiceItem.create({
      :item_id => row[1],
      :invoice_id => row[2],
      :quantity => row[3],
      :unit_price => row[4],
      :created_at => row[5],
      :updated_at => row[6]
    })
  end

puts "invoice_items seeded!"
end
