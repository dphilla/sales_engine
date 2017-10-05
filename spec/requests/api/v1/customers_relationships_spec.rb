describe "invoice_items_relationship" do
  it "returns invoice for invoice_item" do
    invoice = create(:invoice)
    invoice_item = create(:invoice_item, invoice_id: invoice.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice).to eq(invoice)
  end
  it "returns item for invoice_item" do
    item = create(:item)
    invoice_item = create(:invoice_item, item_id: item.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item).to eq(item)
  end
end

