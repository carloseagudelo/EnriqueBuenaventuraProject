class Document < ActiveRecord::Base

	has_and_belongs_to_many :authors_workeds
	has_and_belongs_to_many :books_workeds
	has_and_belongs_to_many :articles
end
