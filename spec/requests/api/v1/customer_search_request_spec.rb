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

  end

  it "finds by created at" do

  end

  it "finds by updated at" do

  end
end

describe "Customers API" do
  it "finds all by first name" do

  end

  it "finds all by last name" do

  end

  it "finds all by created at" do

  end

  it "finds all by updated at" do

  end

end
