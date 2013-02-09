class AddDeviseColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string, :null => false, :default => "" 
    add_column :users, :birth_date, :date, :null => false, :default => ""
  end
end
