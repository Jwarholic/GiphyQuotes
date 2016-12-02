class CreateSearches < ActiveRecord::Migration

  def change
    create_table :searches do |t|
    	t.integer :user_id
    	t.string :word
    	t.string :giphy
    	t.string :quote
      t.timestamps
    end
  end

end
