require 'rails_helper'

describe "Customers API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers.count).to eq(3)
  end

  it "gets one customer by ID" do
    create_list(:customer, 3)

    get "/api/v1/customers/#{Customer.last.id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(Customer.last.id)
  end

end
