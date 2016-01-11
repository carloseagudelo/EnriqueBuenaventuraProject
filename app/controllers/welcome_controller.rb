class WelcomeController < ApplicationController
	before_action :set_welcome, only: [:show, :edit, :update, :destroy]
	before_filter :have_sidebar, except: [:index, :indexUser]

	def index
		@have_sidebar = true
		@articles = Article.all
		@document = Document.find(1)
		@users = User.all
	end

	def indexUser
		@have_sidebar = true
		@articles = Article.all
	end
end
