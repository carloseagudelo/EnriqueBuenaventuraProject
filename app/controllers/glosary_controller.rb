class GlosaryController < ApplicationController

	layout :resolve_layout
	before_action :have_sidebar, except: [:index, :new, :show, :create, :edit, :update, :destroy]

	def index
		@words = Glosary.all
		@have_sidebar = true
	end

	def show
		@word = Glosary.find(params[:id])
		@have_sidebar = true
	end

	def new
		@word = Glosary.new
		@have_sidebar = true
	end

	def create
		@word = Glosary.new(glosary_params)

		if @word.save
			redirect_to glosary_path(@word)
		else 
			reder "new"
		end
	end

	def edit
		@word = Glosary.find(params[:id])
		@have_sidebar = true
	end

	def update
		@word = Glosary.find(params[:id])
		
		if @word.update(glosary_params)
			redirect_to glosary_index_path
		else
			redirect_to glosary_path(@word)
		end
	end

	def destroy

		@word = Glosary.find(params[:id])
	  	
	  	if @word.destroy
	  		redirect_to glosary_index_path
	  	end
	end

private
  def glosary_params
    params.require(:word).permit(:word, :description)
  end

	def resolve_layout
	   	if  current_user.has_role?(:admin)
	      "welcome_root"
	    else 
	      "application"
	    end
	end

end
