class WelcomeRootController < ApplicationController
	before_action :set_welcome_root, only: [:show, :edit, :update, :destroy]

	layout 'welcome_root'

	def index
		@name = current_user.name
	end

end
