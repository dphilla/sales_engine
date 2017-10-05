require 'rails_helper'

describe "Merchants API" do
  it "finds all items for merchant" do
    merch1 = create(:merchant)
    item = create(:item, merchant_id: merch1.id)

    get "/api/v1/merchants/#{merch1.id}/items"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merch1.items.count).to eq(1)
  end
end
