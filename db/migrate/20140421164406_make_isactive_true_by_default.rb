class MakeIsactiveTrueByDefault < ActiveRecord::Migration
  def change
    change_column :clients, :is_active, :boolean, :default => true
  end
end
