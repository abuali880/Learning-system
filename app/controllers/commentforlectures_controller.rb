class CommentforlecturesController < ApplicationController
def create
                @lecture = Lecture.find(params[:lecture_id])
                @comment = @lecture.commentforlectures.create!(comment_params)
               
if @comment.save
  redirect_to @lecture
end
        end
def destroy

		        @lecture = Lecture.find(params[:lecture_id])
		        @comment = @lecture.commentforlectures.find(params[:id])
		       
	       @comment.destroy

	    redirect_to @lecture

end
private
def comment_params
      params.require(:commentforlecture).permit(:body)
    end
end
