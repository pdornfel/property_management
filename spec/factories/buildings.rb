# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    address "33 Harrison Ave"
    city "Boston"
    state "Massachusetts"
    zip_code "02111"
    owner
  end
end
