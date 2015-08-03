class DocumentController < ApplicationController

	layout 'welcome_root'

	def index
		@documents = Document.all		
	end

	def new
		@document = Document.new
	end

	def create
		@document = Document.new(document_params)

		if @document.save
			redirect_to document_index_path, notice: "El docuemto #{@document.name} ha sido guardado correctamente."
		else
			render "new"
		end
	end

	def edit
		@document = Document.find(params[:id])
	end

	def update
	  @document = Document.find(params[:id])
	 
	  if @document.update(document_params)
	    redirect_to document_index_path
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @document = Document.find(params[:id])
	  @document.destroy
	 
	  redirect_to document_index_path
	end

private
  def document_params
    params.require(:document).permit(:name, :description, :date, :autor, :attachment)
  end
end




