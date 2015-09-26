class ChronologyController < ApplicationController

	layout :resolve_layout
	before_filter :have_sidebar, except: [:index, :new, :create, :edit, :show, :update, :destroy]

	def index
		@chronologies = Cronology.all
		@have_sidebar = true
	end

	def new
		@chronology = Cronology.new
		@have_sidebar = true
	end

	def create
		@chronology = Cronology.new(chronology_params)

		if @chronology.save
			redirect_to chronology_index_path
		else
			new_chronology_path
		end		
	end

	def show
		@chronology = Cronology.find(params[:id])
		@have_sidebar = true
	end

	def edit		

	end

	def update

	end

	def destroy

	end

private
  def chronology_params
    params.require(:cronology).permit(:event, :date, :descripton, :url, :type_id)
  end

	def resolve_layout
	   	if  current_user.has_role?(:admin)
	      "welcome_root"
	    else 
	      "application"
	    end
	end
end

