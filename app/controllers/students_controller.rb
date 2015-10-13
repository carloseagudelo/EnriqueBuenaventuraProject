class StudentsController < ApplicationController
	layout :resolve_layout
	before_action :authenticate_user!
	before_filter :have_sidebar, except: [:index, :indexN, :show, :edit, :update, :destroy]

	def index
		if params[:searchS]	
			@users = User.search(params[:searchS])
		else
			@users = User.all
		end
		@have_sidebar = true
	end

	def indexN
		@users = User.all
		@have_sidebar = true
	end

	def show
		@have_sidebar = true
	end

	def edit
		@user = User.find(params[:id])
		@have_sidebar = true
	end

	def update
		@user = User.find(params[:id])

		if @user.has_role?(:student)
			@user.remove_role(:student)
			@user.add_role(:user)
			redirect_to students_path
		elsif @user.has_role?(:user)
			@user.remove_role(:user)
			@user.add_role(:student)
			redirect_to students_indexN_path
		end
	end

	def destroy
		@user = User.find(params[:id])

		if @user.destroy
			students_path
		end
		@have_sidebar = true
	end

private

	def student_params
    	params.require(:user).permit(:email, :name, :interest) 
  	end


	def resolve_layout
	   	if  current_user.has_role?(:admin)
	      "welcome_root"
	    else 
	      "application"
	    end
	end

end
