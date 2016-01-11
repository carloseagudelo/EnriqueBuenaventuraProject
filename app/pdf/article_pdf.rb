class ArticlePdf < Prawn::Document
	def initialize(article, date, user, txt)
		super(top_margin: 70)
		@article = article
		@date = date
		@user = user
		@text = txt
		article_name
		article_date
		article_author
		article_content
	end

	def article_name
		text "#{@article.name}", size: 60, style: :bold, align: :center
	end

	def article_date
		text "#{@date}", size: 20, style: :bold, align: :left
	end

	def article_author
		text "#{@user.name}", size: 20, style: :bold, align: :left
	end

	def article_content  
		text "#{@text}", size: 10
	end

end