require 'rails_helper'

describe "Invoice Endpoint" do
  it "finds by id" do
    create(:merchant, id: 1)
    invoice1, invoice2, invoice3 = create_list(:invoice, 3)

    get "/api/v1/items/find?id=#{invoice1.id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(invoice.id)
  end

  it "finds by custi id" do
    create(:customer, id: 1)
    invoice1, invoice2, invoice3 = create_list(:invoice, 3,  customer_id: 1)

    get "/api/v1/items/find?customer_id=#{invoice1.customer_id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["name"]).to eq(invoice1.customer_id)
  end

  it "finds merchant_id" do
    create(:merchant, id: 1)
    invoice1, invoice2, invoice3 = create_list(:invoice, 3, merchant_id: 1)

    get "/api/v1/items/find?merchant_id=#{invoice1.merchant_id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["description"]).to eq(invoice1.merchant_id)
  end

  it "finds by status" do
    create(:merchant, id: 1)
    invoice1, invoice2, invoice3 = create_list(:invoice, 3, status: "shipped")

    get "/api/v1/items/find?status=#{invoice1.status}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(invoice1.status)
  end

  it "finds by created_at" do
    invoice1, invoice2, invoice3 = create_list(:invoice, 3, created_at: "2")

    get "/api/v1/items/find?created_at=#{invoice.created_at}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(invoice1.created_up)
  end

  it "finds by updated at" do
    create(:merchant, id: 1)
    invoice1, invoice2, invoice3 = create_list(:invoice, 3,  updated_at: "1")

    get "/api/v1/items/find?updated_at=#{invoice1.updated_at}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(invoice1.updated_at)
  end

end
