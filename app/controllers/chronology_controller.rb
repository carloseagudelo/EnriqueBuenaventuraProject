class ChronologyController < ApplicationController

	layout :resolve_layout
	before_filter :have_sidebar, except: [:index, :new, :create, :edit, :update, :destroy]

	def index

	end

	def new
	
	end

	def create

	end

	def edit		

	end

	def update

	end

	def destroy

	end

private
  def chronology_params
    params.require(:article).permit()
  end

	def resolve_layout
	   	if  current_user.has_role?(:admin)
	      "welcome_root"
	    else 
	      "application"
	    end
	end
end
