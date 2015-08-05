class ArticleController < ApplicationController

	layout :resolve_layout

	def index
		@articles = Article.all
	end


















private
  def article_params
    params.require(:article).permit(:name)
  end

	def resolve_layout
	   	if  current_user.has_role?(:admin)
	      "welcome_root"
	     else 
	      "application"
	    end
	end



end
