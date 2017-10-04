require 'rails_helper'

describe "Items API" do
  it "finds by id" do
    item1, item2, item3 = create_list(:item, 3)

    get "/api/v1/items/find?id=#{item1.id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(item1.id)
  end

  it "finds by name" do
    item = create(:item)

  end

  it "finds by description" do

  end

  it "finds by unit price" do

  end

  it "finds by merchant id" do

  end

  it "finds by created at" do

  end

  it "finds by updated at" do

  end


end
