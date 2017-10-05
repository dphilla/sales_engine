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
    ii1 = create(:invoice_item)

    get "/api/v1/invoice_items/find?item_id=#{ii1.item_id}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["item_id"]).to eq(ii1.item_id)
  end

  it "finds by invoice_id" do
    ii1 = create(:invoice_item)

    get "/api/v1/invoice_items/find?invoice_id=#{ii1.invoice_id}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["invoice_id"]).to eq(ii1.invoice_id)
  end

  it "finds by unit price" do
    ii1 = create(:invoice_item)
    price = (ii1.unit_price / 100).to_s

    get "/api/v1/invoice_items/find?unit_price=#{price}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(ii1.id)
  end

  it "finds by created at" do
    ii1 = create(:invoice_item, created_at: "Sep 1 2002")

    get "/api/v1/invoice_items/find?created_at=#{ii1.created_at}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(ii1.id)
  end

  it "finds by updated at" do
    ii1 = create(:invoice_item, updated_at: "Sep 1 2002")

    get "/api/v1/invoice_items/find?updated_at=#{ii1.updated_at}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(ii1.id)
  end

end
