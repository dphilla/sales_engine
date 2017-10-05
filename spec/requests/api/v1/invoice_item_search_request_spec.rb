require 'rails_helper'

describe "InvoiceItems API" do
  it "finds by ID" do
    ii1, ii2, ii3 = create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find?=#{ii1.id}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(ii1.id)
  end

  it "finds by item_id" do

  end

  it "finds by invoice_id" do

  end

  it "fins by unit price" do

  end

end
