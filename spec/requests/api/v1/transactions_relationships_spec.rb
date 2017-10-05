require 'rails_helper'

describe "transaction relationship" do
  it "returns invoice" do
    transaction = create(:transaction)
    invoice = create(:invoice)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction).to eq(transaction)
  end
end
