require 'rails_helper'

describe "InvoiceItems API" do
  it "sends a list of invoice items" do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(3)
  end

  it "gets one invoice item by id" do
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/#{InvoiceItem.last.id}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(InvoiceItem.last.id)
  end

end
