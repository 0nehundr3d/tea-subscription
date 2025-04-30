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

    describe "GET one subscription" do
        it "Should return detailed information about a subscription" do
            subscription = create(:subscription)
            teas = create_list(:tea, 2)

            teas.each do |tea|
                create(:tea_subscription, tea: tea, subscription: subscription)
            end

            get "/api/v1/subscriptions/#{subscription.id}"
            json = JSON.parse(response.body, symbolize_names: true)

            expect(json[:data][:customer_name]).to eq(subscription.customer_name)
            expect(json[:data][:title]).to eq(subscription.title)
            expect(json[:data][:status]).to eq(subscription.status)
            expect(json[:data][:frequency]).to eq(subscription.frequency)
            expect(json[:data][:price]).to eq(subscription.price)
            expect(json[:data][:teas].length).to eq(subscription.teas.length)
            expect(json[:data][:teas][0][:title]).to eq(subscription.teas.first.title)
            expect(json[:data][:teas][0][:description]).to eq(subscription.teas.first.description)
            expect(json[:data][:teas][0][:temperature]).to eq(subscription.teas.first.temperature)
            expect(json[:data][:teas][0][:brew_time]).to eq(subscription.teas.first.brew_time)
            expect(json[:data][:teas][0][:price]).to eq(subscription.teas.first.price)
        end

        it "Should return a 404 error when trying to reach non existant entry" do
            get "/api/v1/subscriptions/1"
            json = JSON.parse(response.body, symbolize_names: true)
            
            expect(response).to have_http_status :not_found
            expect(json[:message]).to eq("Could not find Subscription with id 1")
            expect(json[:status]).to eq(404)
        end
    end

    describe "PATCH one subcription" do
        it "Should be able to update the status of a subscription" do
            subscription = create(:subscription)

            patch "/api/v1/subscriptions/#{subscription.id}", params: {status: "inactive"}
            json = JSON.parse(response.body, symbolize_names: true)
            
            expect(json[:data][:status]).to eq("inactive")
        end

        it "Should be able to activate a subscription" do
            subscription = create(:subscription, status:"inactive")

            patch "/api/v1/subscriptions/#{subscription.id}", params: {status: "active"}
            json = JSON.parse(response.body, symbolize_names: true)
            
            expect(json[:data][:status]).to eq("active")
        end

        it "Should only allow status to be active or inactive" do
            subscription = create(:subscription)

            patch "/api/v1/subscriptions/#{subscription.id}", params: {status: "something"}
            json = JSON.parse(response.body, symbolize_names: true)
            
            expect(response).to have_http_status(400)
            expect(json[:message]).to eq("Status must be either active or inactive")
        end
    end
end