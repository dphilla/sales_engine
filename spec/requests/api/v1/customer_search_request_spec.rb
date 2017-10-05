require 'rails_helper'

describe "Customers API" do
  it "finds by ID" do
    cust1, cust2, cust3 = create_list(:customer, 3)

    get "/api/v1/customers/find?=#{cust1.id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(cust1.id)
  end

  it "finds by first name" do
    cust1, cust2 = create_list(:customer, 2)
    cust3 = create(:customer, first_name: "Roscoe")

    get "/api/v1/customers/find?first_name=#{cust3.first_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["first_name"]).to eq(cust3.first_name)
  end

  it "finds by last name" do
    cust1, cust2 = create_list(:customer, 2)

    get "/api/v1/customers/find?last_name=#{cust2.last_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["last_name"]).to eq(cust2.last_name)
  end

  it "finds by created at date" do
    cust1 = create(:customer, created_at: "Jul 1 1999")

    get "/api/v1/customers/find?created_at=#{cust1.created_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(cust1.id)
  end

  it "finds by updated at" do
    cust1 = create(:customer, updated_at: "Jul 1 1999")

    get "/api/v1/customers/find?updated_at=#{cust1.updated_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(cust1.id)
  end
end

describe "Customers API" do
  it "finds all by first name" do
    customers = create_list(:customer, 3)

    get "/api/v1/customers/find_all?first_name=#{customers[1].first_name}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(3)
    expect(result[1]["first_name"]).to eq("Homer")
  end

  it "finds all by last name" do
    customers = create_list(:customer, 3, last_name: "Lee")

    get "/api/v1/customers/find_all?last_name=#{customers[1].last_name}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(3)
    expect(result[1]["last_name"]).to eq("Lee")
  end

  it "finds all by created at" do
    cust1, cust2, cust3 = create_list(:customer, 3, created_at: "May 1 1985")

    get "/api/v1/customers/find_all?created_at=#{cust1.created_at}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(3)
  end

  it "finds all by updated at" do
    cust1, cust2, cust3 = create_list(:customer, 3, updated_at: "May 1 1985")

    get "/api/v1/customers/find_all?updated_at=#{cust1.updated_at}"

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(3)
  end

end
