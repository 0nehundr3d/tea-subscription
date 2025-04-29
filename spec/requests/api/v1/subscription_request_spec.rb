require "rails_helper"

RSpec.describe "subscriptions api", type: :request do 
    describe "GET all subscriptions" do
        it "Should return all subscriptions" do
            subs = create_list(:subscription, 3)
            tea = create(:tea)
            subs.each do |subscription| 
                create(:tea_subscription, tea: tea, subscription: subscription)
            end

            get "/api/v1/subscriptions"
            json = JSON.parse(response.body, symbolize_names: true)
            
            expect(json[:data].length).to eq(subs.length)
            expect(json[:count]).to eq(json[:data].length)
            expect(json[:data][0][:id]).to eq(subs[0].id)
            expect(json[:data][0][:attributes][:title]).to eq(subs[0].title)
            expect(json[:data][0][:attributes][:customer_name]).to eq(subs[0].customer_name)
            expect(json[:data][0][:attributes][:status]).to eq(subs[0].status)
            expect(json[:data][0][:attributes][:frequency]).to eq(subs[0].frequency)
            expect(json[:data][0][:attributes][:price]).to eq(subs[0].price)
        end
    end
end