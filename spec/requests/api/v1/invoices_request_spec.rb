require 'rails_helper'

describe "invoice request" do
   it "sends a list of invoices" do

     create_list(:invoices, 3)

     get '/api/v1/invoices.json'

     expect(response).to be_success

   end
end
