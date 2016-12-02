class CreateSearches < ActiveRecord::Migration

  def change
    create_table :users do |t|
    	t.integer :user_id
    	t.string :search
    	t.string :results
      t.timestamps
    end
    add_index :users, :email, :unique => true
  end

end
