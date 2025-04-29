class Subscription < ApplicationRecord
    has_many :tea_subscriptions
    has_many :teas, through: :tea_subscriptions
    belongs_to :customer

    def customer_name
        "#{self.customer.first_name} #{self.customer.last_name}"
    end

    def price 
        self.teas.sum do |tea|
            tea.price
        end
    end

    def validate_updates(params)
        if !["active", "inactive"].include?(params[:status])
            return {
                status: 400,
                message: "Status must be either active or inactive"
            }
        end

        return {}
    end
end