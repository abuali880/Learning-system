class LikesController < ApplicationController
	def create
		@slide = Slide.find(params[:id])
       @like = @slide.likes.build
    	if @like.save
            @like.number +=1
    		redirect_to @slide

	end
end
