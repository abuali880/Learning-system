class CommentsController < ApplicationController
	def create
	@sli =Slide.find(params[:slide_id])
@comment = @sli.comments.create(comment_params)
if @comment.save
  redirect_to  slide_path(@sli)
end
end
def destroy
@slide = Slide.find(params[:slide_id])
     @comment = @slide.comments.find(params[:id])
       @comment.destroy

    		redirect_to  slide_path(@slide)

end
private
def comment_params
      params.require(:comment).permit(:content)
    end
end

