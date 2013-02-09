class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.date :post_date
      t.integer :post_id
      t.boolean :status
      t.integer :commenter_id
      t.references :post

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
