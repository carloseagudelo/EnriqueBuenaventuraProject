class ArticleController < ApplicationController

	layout :resolve_layout
	before_filter :have_sidebar, except: [:index, :new, :create, :edit, :update, :destroy]

	def index
		@articles = Article.all
		@users = User.all
		@have_sidebar = true
	end

	def new
		@document = Document.find(params[:document_id])
		@article = Article.new
		@have_sidebar = true	
	end

	def create
		@document = Document.find(params[:document_id])		
		@article = Article.new(article_params)
		@article.user_id = current_user.id

		if @article.save
			redirect_to edit_document_article_path(@document.id, @article.id)
		else
			render "index"
		end
	end

	def edit		
		@documents = Document.all			
		@article = Article.find(params[:id])
		@have_sidebar = true

	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
		 	redirect_to document_index_path
		else 
			render "edit"
		end
	end

	def destroy
	  @have_sidebar = true
	  @article = Article.find(params[:id])
	  @article.destroy
	 
	  redirect_to document_article_index_path
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
