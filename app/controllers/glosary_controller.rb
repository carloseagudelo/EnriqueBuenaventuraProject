class GlosaryController < ApplicationController
	before_action :set_glosary, only: [:show, :edit, :update, :destroy]
end
