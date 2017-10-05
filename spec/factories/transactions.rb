FactoryGirl.define do
  factory :transaction do
    invoice
    credit_card_number "8675309"
    result "success"
  end
end
