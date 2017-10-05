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

describe "InvoiceItems API" do
  it "finds all by unit price" do
    ii1, ii2 = create_list(:invoice_item, 2)
    ii3      = create(:invoice_item, unit_price: 5000)
    price = (ii1.unit_price / 100).to_s

    get "/api/v1/invoice_items/find_all?unit_price=#{price}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(2)
  end

  it "finds all by created at" do
    ii1, ii2 = create_list(:invoice_item, 2, created_at: "Nov 1 1991")
    ii3      = create(:invoice_item, created_at: "Jun 22 2009")

    get "/api/v1/invoice_items/find_all?created_at=#{ii1.created_at}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(2)
  end

  it "finds all by updated at" do
    ii1, ii2 = create_list(:invoice_item, 2, updated_at: "Nov 1 1991")
    ii3      = create(:invoice_item, updated_at: "Jun 22 2009")

    get "/api/v1/invoice_items/find_all?updated_at=#{ii1.updated_at}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(2)
  end

  it "finds all by item id" do
    customer = create(:customer)
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    inv_item1, inv_item2 = create_list(:invoice_item, 2, item_id: item.id, invoice_id: invoice.id)

    get "/api/v1/invoice_items/find_all?item_id=#{item.id}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(2)
  end

  it "finds all by invoice id" do
    customer = create(:customer)
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    inv_item1, inv_item2 = create_list(:invoice_item, 2, item_id: item.id, invoice_id: invoice.id)

    get "/api/v1/invoice_items/find_all?invoice_id=#{invoice.id}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(2)
  end

  it "finds all invoice items by quantity" do
     customer = create(:customer)
     merchant = create(:merchant)
     item = create(:item, merchant_id: merchant.id)
     invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
     inv_item1, inv_item2 = create_list(:invoice_item, 2, quantity: 30, item_id: item.id, invoice_id: invoice.id)
     inv_item3 = create(:invoice_item, quantity: 10, item_id: item.id, invoice_id: invoice.id)

     get "/api/v1/invoice_items/find_all?quantity=#{inv_item1.quantity}"

     output = JSON.parse(response.body)

     expect(response).to be_success
     expect(output.count).to eq(2)
   end

end
