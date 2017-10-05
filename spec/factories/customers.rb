FactoryGirl.define do
  factory :customer do
    first_name "Homer"
    sequence :last_name do |n|
      "Simpson#{n}"
    end
  end
end
