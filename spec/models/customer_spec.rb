require "rails_helper"

RSpec.describe Customer, type: :model do
    describe "relstionships" do
        it { should have_many :subscriptions }
    end
end