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
		@document = Document.find(params[:document_id])		
		@article = Article.new(article_params)
		@article.user_id = current_user.id

		if @article.save
			render "edit"
		else
			render "index"
		end
	end

	def edit
		@document = Document.find(params[:document_id])		
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
		 	redirect_to document_index_path
		else 
			render "edit"
		end
	end




	
private
  def article_params
    params.require(:article).permit(:user_id, :name, :date, :decription, :attachment)
  end

	def resolve_layout
	   	if  current_user.has_role?(:admin)
	      "welcome_root"
	     else 
	      "application"
	    end
	end



end
