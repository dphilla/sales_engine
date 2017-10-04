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

    get "/api/v1/items/find?name=#{item.name}"

    itemfind = JSON.parse(response.body)

    expect(response).to be_success
    expect(itemfind["name"]).to eq(item.name)
  end

  it "finds by description" do
    item = create(:item)

    get "/api/v1/items/find?description=#{item.description}"

    itemfind = JSON.parse(response.body)

    expect(response).to be_success
    expect(itemfind["description"]).to eq(item.description)
  end

  it "finds by unit price" do
    item = create(:item)
    item_price = (item.unit_price / 100).to_s

    get "/api/v1/items/find?unit_price=#{item_price}"

    itemfind = JSON.parse(response.body)

    expect(response).to be_success
    expect(itemfind["unit_price"]).to eq(item.unit_price)
  end

  it "finds by merchant id" do

  end

  it "finds by created at" do

  end

  it "finds by updated at" do

  end


end
