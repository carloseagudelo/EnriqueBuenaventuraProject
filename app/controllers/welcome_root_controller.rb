class WelcomeRootController < ApplicationController
	before_action :set_welcome_root, only: [:show, :edit, :update, :destroy]
	before_filter :have_sidebar, except: [:index]

	layout 'welcome_root'

	def index
		@name = current_user.name
		@user =  User.with_role(:admin).count
		@document = Document.count(:all)
		@article = Article.count(:all)
		@have_sidebar = true
	end

end
