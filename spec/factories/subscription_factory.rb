FactoryBot.define do
    factory :subscription do
        title { "subscription" }
        status { "active" }
        frequency { "1 month" }
        customer
    end
end