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
    end
end