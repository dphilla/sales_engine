require 'rails_helper'

describe "invoices_items relationships" do
 it "finds invoice_item for item" do
    item = create(:item)
    invoice = create(:invoice)
    invoice_item = create(:invoice_item, item_id: item.id, invoice_id: invoice.id)

    get "/api/v1/items/#{item.id}/invoice_items"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item.invoice_items.count).to eq(1)
  end

  it "finds merchant for item" do
    item = create(:item)
    merchant = create(:merchant)

    get "/api/v1/items/#{item.id}/merchant"

    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(item.merchant).to eq(merchant)
  end
end

