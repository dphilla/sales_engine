require 'rails_helper'

describe "invoice request" do
   it "sends a list of invoices" do

     create_list(:invoice, 3)

     get '/api/v1/invoices'

     expect(response).to be_success

     invoices = JSON.parse(response.body)

     expect(invoices.count).to eq(3)

   end

   it "sends back one invoice" do

     create_list(:invoice, 3)

     get "/api/v1/invoices/#{Invoice.last.id}"

     invoice = JSON.parse(response.body)

     expect(invoice["id"]).to eq(Invoice.last.id)


   end
end
