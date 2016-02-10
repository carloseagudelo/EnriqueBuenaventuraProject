class SubtopicController < ApplicationController

	layout :resolve_layout
	before_action :have_sidebar, except: [:index, :new, :show, :create, :edit, :update, :destroy]

	def index
		@subtopics = Subtopic.all
		@have_sidebar = true
	end

	def show
		@subtopic = Subtopic.find(params[:id])
		@have_sidebar = true
	end

	def new
		@subtopic = Subtopic.new
		@have_sidebar = true
	end

	def create
		@subtopic = Subtopic.new(subtopic_params)

		if @subtopic.save
			redirect_to subtopic_index_path
		else 
			flash[:notice] = "ERROR, Está ingresando mal la información, por favor verificar los campos e intenta de nuevo"
			redirect_to new_subtopic_path
		end
	end

	def edit
		@subtopic = Subtopic.find(params[:id])
		@have_sidebar = true
	end

	def update
		@subtopic = Subtopic.find(params[:id])
		
		if @subtopic.update(subtopic_params)
			redirect_to subtopic_index_path
		else
			redirect_to edit_subtopic_path(@word)
		end
	end

	def destroy
		@subtopic = Subtopic.find(params[:id])
	  	
	  	if @subtopic.destroy
	  		redirect_to subtopic_index_path
	  	end
	end

private
  def subtopic_params
    params.require(:subtopic).permit(:name, :description)
  end

	def resolve_layout
	   	if  current_user.has_role?(:admin)
	      "welcome_root"
	    else 
	      "application"
	    end
	end

end
