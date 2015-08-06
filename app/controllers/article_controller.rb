class ArticleController < ApplicationController

	layout :resolve_layout

	def index
		@articles = Article.all
	end

	def new
		@document = Document.find(params[:document_id])
		@article = Article.new

	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to article_index_path, notice: "El articulo #{@article.name} ha sido guardado correctamente."
		else
			render "new"
		end
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
