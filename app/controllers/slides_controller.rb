class SlidesController < ApplicationController
  before_filter :authorize, only: [:show, :upvote, :downvote]
	def show
         #@lecture =Lecture.find(params[:lecture_id])
		#@slides = @lecture.slides.find(params[:id])
		#@comment = @slides.comments.new
		#@comments = @slides.comments
	@slide = Slide.find(params[:id])
        @comments = @slide.comments
	end

def upvote
  @slide = Slide.find(params[:id])
 @slide.liked_by current_user
  redirect_to slide_path(@slide)
end
def downvote
  @slide = Slide.find(params[:id])
 @slide.disliked_by current_user
  redirect_to slide_path(@slide)
end

	

end

#def show
#@slide = Slide.find(params[:id])
#@comments = @slide.comments

#end

 # def create
  #  @lecture = Lecture.find(params[:lecture_id])
   # @slide = @lecture.slides.create(slide_params)
    #  if @slide.save
     #   redirect_to lecture_path(@lecture)
    #end
  #end
#def slide_params
 #     params.require(:slide).permit(:content)
  #  end
