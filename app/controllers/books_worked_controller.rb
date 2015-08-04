class BooksWorkedController < ApplicationController
	before_action :set_books_worked, only: [:show, :edit, :update, :destroy]
end
