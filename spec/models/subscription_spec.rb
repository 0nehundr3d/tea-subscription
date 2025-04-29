require "rails_helper"

RSpec.describe Subscription, type: :model do
    describe "relationships" do
        it { should have_many :tea_subscriptions }
        it { should have_many(:teas).through :tea_subscriptions }
        it { should belong_to :customer }
    end

    describe "instance methods" do
        before(:each) do
            @customer = create(:customer, first_name: "John", last_name: "Doe")
            @subscription = create(:subscription, customer: @customer)
        end

        describe "#customer_name" do
            it "Should return a customers first and last name" do
                expect(@subscription.customer_name).to eq("John Doe")
            end
        end

        describe "#price" do
            it "Should return the price of a given subscription" do
                tea = create(:tea)
                create(:tea_subscription, tea: tea, subscription: @subscription)

                expect(@subscription.price).to eq(15.00)
            end

            it "Shoud function with several teas" do
                tea = create(:tea)
                create(:tea_subscription, tea: tea, subscription: @subscription)
                tea2 = create(:tea, price: 20.00)
                create(:tea_subscription, tea: tea2, subscription: @subscription)

                expect(@subscription.price).to eq(35.00)
            end

            it "Should function with no teas" do
                expect(@subscription.price).to eq(0.00)
            end
        end
    end
end