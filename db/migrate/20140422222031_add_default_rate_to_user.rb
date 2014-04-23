class AddDefaultRateToUser < ActiveRecord::Migration
  def change
    add_column :users, :default_rate, :integer
  end
end
