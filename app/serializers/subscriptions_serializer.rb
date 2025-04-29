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
            end,
            count: subscriptions.count
        }
    end

    def self.serialize_subscription(subscription)
        {
            data: {
                id: subscription.id,
                customer_name: subscription.customer_name,
                title: subscription.title,
                status: subscription.status,
                frequency: subscription.frequency,
                price: subscription.price,
                teas: TeasSerializer.serialize_teas(subscription.teas)[:data]
            }
        }
    end
end