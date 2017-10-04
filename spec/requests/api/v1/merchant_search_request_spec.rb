require 'rails_helper'

describe "Merchants API" do
  it "finds by id" do
    merch1, merch2, merch3 = create_list(:merchant, 3)

    get "/api/v1/merchants/find?id=#{merch1.id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(merch1.id)
  end

  it "finds by name" do
    merch1, merch2, merch3 = create_list(:merchant, 3)

    get "/api/v1/merchants/find?name=#{merch1.name}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq(merch1.name)
  end

  it "finds by created at date" do
    merch1, merch2, merch3 = create_list(:merchant, 3)

    get "/api/v1/merchants/find?created_at=#{merch1.created_at}"
# binding.pry
    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["created_at"]).to eq(merch1.created_at)
  end

  it "finds by updated at date" do
    merch1, merch2, merch3 = create_list(:merchant, 3)

    get "/api/v1/merchants/find?updated_at=#{merch1.updated_at}"
# binding.pry
    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["updated_at"]).to eq(merch1.updated_at)
  end
end

describe "Merchants API" do
  it "finds all by id" do
    
  end

  it "finds all by name" do
    merchants = create_list(:merchant, 3, name: "Merchguy")

    get "/api/v1/merchants/find_all?name=#{merchants[1].name}"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.count).to eq(3)
    expect(json[1]["name"]).to eq("Merchguy")
  end

  it "finds all by created at" do
    merch1, merch2, merch3 = create_list(:merchant, 3)

    get "/api/v1/merchants/find_all?created_at=#{merch1.created_at}"
  # binding.pry
    merchant = JSON.parse(response.body)
  end

  it "finds all by updated at" do

  end

end
