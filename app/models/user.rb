class User < ActiveRecord::Base
  
  resourcify
  
  belongs_to :role 
  has_many :articles

  rolify :before_add => :before_add_method

  after_create :assign_default_role

  def assign_default_role
    add_role(:user) if self.roles.blank?
  end

  def before_add_method(role)
    # do something before it gets added
  end

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("credential like ?", "%#{query}%") 
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
