FactoryBot.define do
    factory :tea do
        title { "tea #1" }
        description { "tea" }
        temperature { 100 }
        brew_time { "5 minutes" }
        price { 15.00 }
    end
end