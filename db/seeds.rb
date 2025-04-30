# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

customer1 = Customer.create!(
    first_name: "customer1",
    last_name: "lastname",
    email: "customer@teasubscription.com",
    address: "123 Street Cr"
)

sub1 = Subscription.create!(
    title: "demo teas",
    status: "active",
    frequency: "1 month",
    customer: customer1
)

sub2 = Subscription.create!(
    title: "demo teas 2",
    status: "active",
    frequency: "1 month",
    customer: customer1
)

tea1 = Tea.create!(
    title: "demo tea 1",
    description: "its tea",
    temperature: 3600,
    brew_time: "13 seconds",
    price: 13.00
)

tea2 = Tea.create!(
    title: "demo tea 2",
    description: "its probably also tea",
    temperature: 200,
    brew_time: "12 days",
    price: 17.35
)

TeaSubscription.create!(tea: tea1, subscription: sub1)
TeaSubscription.create!(tea: tea1, subscription: sub2)
TeaSubscription.create!(tea: tea2, subscription: sub2)