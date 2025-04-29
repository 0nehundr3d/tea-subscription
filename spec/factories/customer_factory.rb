FactoryBot.define do 
    factory :customer do
        first_name { "first_name" }
        last_name { "last_name" }
        email { "email@test.com" }
        address { "123 demo st" }
    end
end