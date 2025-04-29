class RemoveSubscriptionFromCustomer < ActiveRecord::Migration[7.1]
  def change
    remove_column :customers, :subscription_id
  end
end
