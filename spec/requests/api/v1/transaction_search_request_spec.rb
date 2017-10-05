require 'rails_helper'

describe "Transactions API" do
  it "finds by id" do
    transaction1, transaction2 = create_list(:transaction, 2)

    get "/api/v1/transactions/find?=#{transaction1.id}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(transaction1.id)
  end

  it "finds by invoice id do" do
    transaction = create(:transaction)

    get "/api/v1/transactions/find?invoice_id=#{transaction.invoice_id}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["invoice_id"]).to eq(transaction.invoice_id)
  end

  it "finds by credit card number" do
    transaction = create(:transaction)

    get "/api/v1/transactions/find?credit_card_number=#{transaction.credit_card_number}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["credit_card_number"]).to eq(transaction.credit_card_number)
  end

  it "finds by created at" do
    transaction = create(:transaction, created_at: "Aug 1 1999")

    get "/api/v1/transactions/find?created_at=#{transaction.created_at}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(transaction.id)
  end

  it "finds by updated at" do
    transaction = create(:transaction, updated_at: "Aug 1 1999")

    get "/api/v1/transactions/find?updated_at=#{transaction.updated_at}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["id"]).to eq(transaction.id)
  end
end

describe "Transactions API" do
  it "finds all by credit card number" do
    transactions = create_list(:transaction, 3)

    get "/api/v1/transactions/find_all?credit_card_number=#{transactions[1].credit_card_number}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(3)
  end

  it "finds all by created at" do
    transaction1, transaction2 = create_list(:transaction, 2, created_at: "Dec 11 2008")
    transaction3 = create(:transaction, created_at: "Jun 01 1998")

    get "/api/v1/transactions/find_all?created_at=#{transaction1.created_at}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(2)
  end

  it "finds all by updated at" do
    transaction1, transaction2 = create_list(:transaction, 2, updated_at: "Dec 11 2008")
    transaction3 = create(:transaction, updated_at: "Jun 01 1998")

    get "/api/v1/transactions/find_all?updated_at=#{transaction1.updated_at}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(2)
  end
end
