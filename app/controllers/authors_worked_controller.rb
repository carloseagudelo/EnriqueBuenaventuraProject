class AuthorsWorkedController < ApplicationController

	layout :resolve_layout
	before_action :have_sidebar, except: [:index, :new, :show, :create, :edit, :update, :destroy]

	def index

		if params[:search]
			@authors = Author.search(params[:search])
		else
			@authors = Author.all
		end
		@have_sidebar = true
	end

	def show
		@author = Author.find(params[:id])
		@have_sidebar = true
	end

	def new
		@author = Author.new
		@have_sidebar = true
	end

	def create
		@author = Author.new(author_params)

		if @author.save
			redirect_to authors_worked_index_path
		else 
			flash[:notice] = "ERROR, Está ingresando mal la información, por favor verificar los campos e intenta de nuevo"
			redirect_to new_authors_worked_path
		end
	end

	def edit
		@author = Author.find(params[:id])
		@have_sidebar = true
	end

	def update
		@author = Author.find(params[:id])
		
		if @author.update(author_params)
			redirect_to authors_worked_index_path
		else
			redirect_to edit_authors_worked_path(@author)
		end
	end

	def destroy

		@author = Author.find(params[:id])
	  	
	  	if @author.destroy
	  		redirect_to authors_worked_index_path
	  	end
	end

private
  def author_params
    params.require(:author).permit(:name, :description)
  end

	def resolve_layout
	   	if  current_user.has_role?(:admin)
	      "welcome_root"
	    else 
	      "application"
	    end
	end
end
