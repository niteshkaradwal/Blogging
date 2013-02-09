class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :user_id, :null => false, :default => ""
      t.integer :follower_id, :null => false, :default => ""
			t.references :user
      t.timestamps
    end
  end
end
