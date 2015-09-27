class SpecialityController < ApplicationController

	layout :resolve_layout
	before_action :have_sidebar, except: [:index, :new, :show, :create, :edit, :update, :destroy]

	def index
		@specialities = Speciality.all
		@have_sidebar = true
	end

	def show
		@speciality = Speciality.find(params[:id])
		@have_sidebar = true
	end

	def new
		@speciality = Speciality.new
		@have_sidebar = true
	end

	def create
		@speciality = Speciality.new(speciality_params)

		if @speciality.save
			redirect_to speciality_index_path
		else 
			reder new_speciality_path
		end
	end

	def edit
		@speciality = Speciality.find(params[:id])
		@have_sidebar = true
	end

	def update
		@speciality = Speciality.find(params[:id])
		
		if @speciality.update(speciality_params)
			redirect_to speciality_index_path
		else
			redirect_to edit_speciality_path(@word)
		end
	end

	def destroy

		@speciality = Speciality.find(params[:id])
	  	
	  	if @speciality.destroy
	  		redirect_to speciality_index_path
	  	end
	end

private
  def speciality_params
    params.require(:speciality).permit(:name, :description)
  end

	def resolve_layout
	   	if  current_user.has_role?(:admin)
	      "welcome_root"
	    else 
	      "application"
	    end
	end

end
