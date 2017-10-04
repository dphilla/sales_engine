FactoryGirl.define do
  factory :item do
    name "MyItem"
    description "MyItemDescription"
    unit_price 1000
    merchant
  end
end
