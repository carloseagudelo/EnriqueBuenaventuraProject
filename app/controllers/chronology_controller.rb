class ChronologyController < ApplicationController
	before_action :set_chronology, only: [:show, :edit, :update, :destroy]
end
