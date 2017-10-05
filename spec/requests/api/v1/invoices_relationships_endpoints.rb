require 'rails_helper'

describe "invoices_relationship" do
  it "finds all transactions for invoice" do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice_id: invoice.id)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices.transactions.count).to eq(1)
  end


  it "finds all invoice_items for invoice" do
    invoice = create(:invoice)
    invoice_id = create(:invoice_items, invoice_id: invoice.id)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice.invoice_items.count).to eq(1)
  end
  it "finds all items for invoice" do
    invoice = create(:invoice)
    item = create(:items, invoice_id: invoice.id)

    get "/api/v1/invoices/#{invoice.id}/items"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice.items.count).to eq(1)
  end
  it "finds all customers for invoice" do
    invoice = create(:invoice)
    item = create(:customer, invoice_id: invoice.id)

    get "/api/v1/invoices/#{invoice.id}/customer"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice.customer.count).to eq(1)
  end
  it "finds the merchant for invoice" do
    invoice = create(:invoice)
    merchant = create(:merchant, invoice_id: invoice.id)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice.merchant.count).to eq(1)
  end
end
