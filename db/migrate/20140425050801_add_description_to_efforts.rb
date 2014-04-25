class AddDescriptionToEfforts < ActiveRecord::Migration
  def change
    add_column :efforts, :description, :text
  end
end
