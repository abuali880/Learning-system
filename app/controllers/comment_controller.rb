class CommentsController < ApplicationController

	def create
		@slide = Slide.find(params[:id])
    @comment = @slide.comments.build(params[:content)
    	if @comment.save
    		redirect_to @slide

	end
def destroy
@slide = Slide.find(params[:id])
     @comment = @slide.comments.find(comment_params)
        @comment.destroy
    		redirect_to @slide

end
 private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
