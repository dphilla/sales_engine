require 'rails_helper'

describe "Merchant_invoices_relationship" do
  it "finds all invoices for merchant" do
    merch1 = create(:merchant)
    invoice = create(:invoice, merchant_id: merch1.id)

    get "/api/v1/merchants/#{merch1.id}/invoices"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merch1.invoices.count).to eq(1)
  end
end

