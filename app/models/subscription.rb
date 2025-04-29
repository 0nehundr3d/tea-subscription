class Subscription < ApplicationRecord
    has_many :tea_subscriptions
    has_many :teas, through: :tea_subscriptions
    belongs_to :customer

    def customer_name
        "#{self.customer.first_name} #{self.customer.last_name}"
    end
end