FactoryBot.define do
  factory :record_address do

    token {"tok_abcdefghijk00000000000000000"}
    post_code { '111-1111' }
    prefecture_id { 2 }
    city { '多摩市' }
    address { '111-1' }
    building_name { 'アパートA' }
    phone_number { '09011112222' }

  end
end
