require 'rake'
require 'csv'


task :import => [:environment] do

Merchant.destroy_all
file = "db/csv/merchants.csv"

  CSV.foreach(file, :headers => true) do |row|
    Merchant.create({
      :name => row[1],
      :created_at => row[2],
      :updated_at => row[3]
    })
  end

puts "merchants seeded!"


end
