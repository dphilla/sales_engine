require 'rails_helper'

RSpec.describe Merchant, type: :model do

  create_list(:merchant, 3)

  Expect(Merchant.top_by_revenue(quantity)).to eq ()

end
