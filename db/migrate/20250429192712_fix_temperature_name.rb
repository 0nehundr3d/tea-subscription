class FixTemperatureName < ActiveRecord::Migration[7.1]
  def change
    rename_column :teas, :temerature, :temperature
  end
end
