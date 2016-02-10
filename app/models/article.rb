class Article < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :documents

  	def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    	where("name like ?", "%#{query}%") 
  	end

  	validates :name, :uniqueness => true
	validates_presence_of :name, :decription
end
