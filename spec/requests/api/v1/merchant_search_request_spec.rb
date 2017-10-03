require 'rails_helper'

describe "Merchants API" do
  it "finds by id" do
    merch1, merch2, merch3 = create_list(:merchant, 3)

    get "/api/v1/merchants/find?id=#{merch1.id}"

    merchant = JSON.parse(response.body)
# binding.pry
    expect(response).to be_success
    expect(merchant["id"]).to eq(merch1.id)
  end

  it "finds by name" do

  end

  it "finds by created at date" do

  end

  it "finds by updated at date" do

  end

end
