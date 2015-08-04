class AuthorsWorkedController < ApplicationController
	before_action :set_authors_worked, only: [:show, :edit, :update, :destroy]
end
