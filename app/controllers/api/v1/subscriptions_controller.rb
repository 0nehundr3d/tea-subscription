class Api::V1::SubscriptionsController < ApplicationController
    def index
        render json: SubscriptionsSerializer.serialize_subscriptions(Subscription.all)
    end
end