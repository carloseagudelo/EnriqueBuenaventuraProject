class WelcomeController < ApplicationController
	before_action :set_welcome, only: [:show, :edit, :update, :destroy]
	before_filter :have_sidebar, except: [:index, :indexUser]

	def index
		@have_sidebar = true
	end

	def indexUser
		@have_sidebar = true
	end
end
