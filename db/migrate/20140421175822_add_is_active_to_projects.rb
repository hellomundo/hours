class AddIsActiveToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :is_active, :boolean, :default => true
  end
end
