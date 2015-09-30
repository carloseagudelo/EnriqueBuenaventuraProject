class ArticleController < ApplicationController

	
	before_filter :have_sidebar, except: [:index, :new, :create, :edit, :update, :destroy]

	def index
		
		if params[:searchA]
			@articles = Article.search(params[:searchA])
		else
			@articles = Article.all
		end
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
		@article.date = Time.now

		if @article.save
			redirect_to edit_document_article_path(@document.id, @article.id)
		else
			redirect_to new_document_article_path(@document.id, @article.id)
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
		 	redirect_to edit_document_article_path(:document_id, @article.id)
		else 
			redirect_to edit_document_article_path(:document.id, @article.id)
		end
	end

	def destroy	 
		@article = Article.find(params[:id])
		  
		if @article.destroy	 
		  	redirect_to document_article_index_path
		end
		@have_sidebar = true
		end

private
  def article_params
    params.require(:article).permit(:name, :date, :decription, :attachment, :document_id, :user_id)
  end

	def resolve_layout
	   	if  current_user.has_role?(:admin)
	      "welcome_root"
	    else 
	      "application"
	    end
	end



end
