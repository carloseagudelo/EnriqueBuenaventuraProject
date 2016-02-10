#render new_prose_path
class ProseController < ApplicationController

	layout :resolve_layout
	before_action :have_sidebar, except: [:index, :new, :show, :create, :edit, :update, :destroy]

	def index
		@proses = Prose.all
		@have_sidebar = true
	end

	def show
		@prose = Prose.find(params[:id])
		@have_sidebar = true
	end

	def new
		@prose = Prose.new
		@have_sidebar = true
	end

	def create
		@prose = Prose.new(prose_params)

		if @prose.save
			redirect_to prose_index_path
		else 
			flash[:notice] = "ERROR, Está ingresando mal la información, por favor verificar los campos e intenta de nuevo"
			redirect_to new_prose_path
		end
	end

	def edit
		@prose = Prose.find(params[:id])
		@have_sidebar = true
	end

	def update
		@prose = Prose.find(params[:id])
		
		if @prose.update(prose_params)
			redirect_to prose_index_path
		else
			redirect_to edit_prose_path(@word)
		end
	end

	def destroy
		@prose = Prose.find(params[:id])
	  	
	  	if @prose.destroy
	  		redirect_to prose_index_path
	  	end
	end

private
  def prose_params
    params.require(:prose).permit(:name, :description)
  end

	def resolve_layout
	   	if  current_user.has_role?(:admin)
	      "welcome_root"
	    else 
	      "application"
	    end
	end

end
