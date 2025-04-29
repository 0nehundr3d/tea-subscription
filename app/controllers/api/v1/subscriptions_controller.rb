class Api::V1::SubscriptionsController < ApplicationController
    def index
        render json: SubscriptionsSerializer.serialize_subscriptions(Subscription.all)
    end

    def show
        render json: SubscriptionsSerializer.serialize_subscription(Subscription.find(params[:id]))
    end
end