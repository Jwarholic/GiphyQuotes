class Search < ActiveRecord::Base
	belongs_to :user
	validates :user_id, :word, :giphy, :quote, presence: true
  # Remember to create a migration!
end
