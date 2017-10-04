FactoryGirl.define do
  factory :merchant do
    sequence :name do |n|
      "MerchantDude#{n}"
    end
  end
end
