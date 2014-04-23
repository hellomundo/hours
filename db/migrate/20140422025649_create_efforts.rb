class CreateEfforts < ActiveRecord::Migration
  def change
    create_table :efforts do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :duration
      t.datetime :performed_on
      t.integer :rate

      t.timestamps
    end
  end
end
