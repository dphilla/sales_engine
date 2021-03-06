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
    expect(itemfind["id"]).to eq(item.id)
  end

  it "finds by merchant id" do
    item = create(:item)

    get "/api/v1/items/find?merchant_id=#{item.merchant_id}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result["merchant_id"]).to eq(item.merchant_id)
  end

  it "finds by created at" do
    item = create(:item, created_at: "Apr 1 2000")

    get "/api/v1/items/find?created_at=#{item.created_at}"

    itemfind = JSON.parse(response.body)

    expect(response).to be_success
    expect(itemfind["id"]).to eq(item.id)
  end

  it "finds by updated at" do
    item = create(:item, updated_at: "Apr 1 2000")

    get "/api/v1/items/find?updated_at=#{item.updated_at}"

    itemfind = JSON.parse(response.body)

    expect(response).to be_success
    expect(itemfind["id"]).to eq(item.id)
  end

end

describe "Items API" do
  it "finds all by name" do
    items = create_list(:item, 3)

    get "/api/v1/items/find_all?name=#{items[1].name}"

    itemfind = JSON.parse(response.body)

    expect(response).to be_success
    expect(itemfind.count).to eq(3)
    expect(itemfind[1]["name"]).to eq("MyItem")
  end

  it "finds all by unit price" do
    item1, item2 = create_list(:item, 2)
    item3 = create(:item, unit_price: 9999)
    item_price = (item1.unit_price / 100).to_s

    get "/api/v1/items/find_all?unit_price=#{item_price}"

    itemfind = JSON.parse(response.body)

    expect(response).to be_success
    expect(itemfind.count).to eq(2)
  end

  it "finds all by description" do
    item1, item2 = create_list(:item, 2)
    item3 = create(:item, description: "some thing")

    get "/api/v1/items/find_all?description=#{item1.description}"

    itemfind = JSON.parse(response.body)

    expect(response).to be_success
    expect(itemfind.count).to eq(2)
  end

  it "finds all by created at" do
    item1, item2 = create_list(:item, 2, created_at: "Dec 11 2008")
    item3 = create(:item, created_at: "Jun 01 1998")

    get "/api/v1/items/find_all?created_at=#{item1.created_at}"

    itemfind = JSON.parse(response.body)

    expect(response).to be_success
    expect(itemfind.count).to eq(2)
  end

  it "finds all by updated at" do
    item1, item2 = create_list(:item, 2, updated_at: "Dec 11 2008")
    item3 = create(:item, updated_at: "Jun 01 1998")

    get "/api/v1/items/find_all?updated_at=#{item1.updated_at}"

    itemfind = JSON.parse(response.body)

    expect(response).to be_success
    expect(itemfind.count).to eq(2)
  end
end
