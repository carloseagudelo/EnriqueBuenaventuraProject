class ArticleController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
end
