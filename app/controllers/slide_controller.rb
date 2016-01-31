class SlidesController < ApplicationController
	def index
		@lecture = Lecture.find(params[:id])
		@slides = @lecture.slides.find(params[:id])
	end
end
