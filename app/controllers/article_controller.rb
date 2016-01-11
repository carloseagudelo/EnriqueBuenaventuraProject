
class ArticleController < ApplicationController

	layout :resolve_layout
	before_filter :have_sidebar, except: [:index, :new, :create, :edit, :show, :update, :destroy, :updatestate, :editstate, :editpublic, :updatepublic, :indexDeleted]

	def index		
		if params[:searchA] 
			@articles = Article.search(params[:searchA])
		else
			@articles = Article.all
		end
		@users = User.all
		@have_sidebar = true
	end

	def indexDeleted		
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

	#define si articulo esta eliminado
	def editstate
		@documents = Document.all			
		@article = Article.find(params[:id])
		@have_sidebar = true
	end

	##define si articulo esta eliminado
	def updatestate
		@article = Article.find(params[:id])
		if @article.stata == true
			@article.stata = false
		else
			@article.stata = true
		end	

		if @article.update(article_params)
		 	redirect_to document_article_index_path
		else 
			redirect_to document_article_index_path
		end
		@have_sidebar = true
	end

	def editpublic
		@documents = Document.all			
		@article = Article.find(params[:id])
		@have_sidebar = true
	end

	def updatepublic
		@article = Article.find(params[:id])
		if @article.statepublic == false
			@article.statepublic = true
		else
			@article.statepublic = false
		end		

		if @article.update(article_params)
		 	redirect_to document_article_index_path
		else 
			redirect_to document_article_index_path
		end
		@have_sidebar = true
	end

	def show
		@article = Article.find(params[:id])
		@date = @article.date.day.to_s + " " + @article.date.strftime("%b") + " " + @article.date.strftime("%Y")
		@user = User.find(@article.user_id)
		@txt = ActionView::Base.full_sanitizer.sanitize(@article.attachment)

		respond_to do |format|
			format.html
			format.pdf do
				pdf = ArticlePdf.new(@article, @date, @user, @txt)
				send_data pdf.render, filename: "arcticle_#{@article.name}.pdf",
									  type: "application/pdf",
									  disposition: "inline"
			end
		end
	end


private
  def article_params
    params.require(:article).permit(:name, :date, :decription, :attachment, :document_id, :user_id, :stata, :statepublic)
  end

	def resolve_layout
	   	if  current_user.has_role?(:admin)
	      "welcome_root"
	    else 
	      "application"
	    end
	end



end
