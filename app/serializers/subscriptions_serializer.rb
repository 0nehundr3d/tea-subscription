class SubscriptionsSerializer
    def self.serialize_subscriptions(subscriptions)
        {
            data: subscriptions.map do |subscription|
                {
                    id: subscription.id,
                    type: "subscription",
                    attributes: {
                        title: subscription.title,
                        customer_name: subscription.customer_name,
                        status: subscription.status,
                        frequency: subscription.frequency,
                        price: subscription.price
                    }
                }
            end
        }
    end
end