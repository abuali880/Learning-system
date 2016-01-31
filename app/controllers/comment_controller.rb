class CommentsController < ApplicationController
	def create
		@slide = Slide.find(params[:id])
    @comment = @slide.comments.build(params[:content)
    	if @comment.save
    		redirect_to @slide

	end
end
