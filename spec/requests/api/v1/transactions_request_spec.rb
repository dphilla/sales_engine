require 'rails_helper'

describe "Transactions API" do
  it "sends a list of Transactions" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction.count).to eq(3)
  end

  it "gets one transaction by id" do
    create_list(:transaction, 3)

    get "/api/v1/transactions/#{Transaction.last.id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(Transaction.last.id)
  end
end
