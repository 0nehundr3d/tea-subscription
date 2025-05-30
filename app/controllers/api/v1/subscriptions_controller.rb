class Api::V1::SubscriptionsController < ApplicationController
    def index
        render json: SubscriptionsSerializer.serialize_subscriptions(Subscription.all)
    end

    def show
        render json: SubscriptionsSerializer.serialize_subscription(Subscription.find(params[:id]))
    end

    def update
        subscription = Subscription.find(params[:id])
        
        error = subscription.validate_updates(sub_params)
        return render json: error, status: error[:status] if !error.empty?

        subscription.update!(sub_params)
        render json: SubscriptionsSerializer.serialize_subscription(subscription)
    end

    private

    def sub_params
        params.permit(:status)
    end
end