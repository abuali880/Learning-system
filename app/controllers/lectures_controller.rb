class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, only: [:new, :edit, :update, :destroy, :show, :index, :upvote, :downvote]
  # GET /lectures
  # GET /lectures.json
  def index
    @lectures = Lecture.search(params[:search])
  end
def describtion
end
  # GET /lectures/1
  # GET /lectures/1.json
  def show
    @slides =@lecture.slides(params[:urlpage])
     @comments = @lecture.commentforlectures
    
  end

  # GET /lectures/new
  def new
    @lecture = Lecture.new
  end

  # GET /lectures/1/edit
  def edit
  end

  # POST /lectures
  # POST /lectures.json
  def create
    @lecture = Lecture.new(lecture_params)
    @lecture.my_file = params[:file]
    if @lecture.save
      @f = @lecture.my_file.to_s.downcase
      @pdf = Grim.reap(@lecture.my_file.current_path)
      @count = @pdf.count
      @filename = @lecture.my_file.to_s.split('/').last
      @counter = 0
      @pdf.each do  |page|
      page.save("app/assets/images/#{@filename}page_#{ @counter }.png")
      @lecture.slides.create(:urlpage => "#{@filename}page_#{ @counter }.png")
        @counter +=1
      end
      redirect_to :controller => 'lectures', :action => 'index' 



    end
    
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
    respond_to do |format|
      if @lecture.update(lecture_params)
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :edit }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end
def upvote
  @lecture = Lecture.find(params[:id])
 @lecture.liked_by current_user
  redirect_to lecture_path(@lecture)
end
def downvote
  @lecture = Lecture.find(params[:id])
 @lecture.disliked_by current_user
  redirect_to lecture_path(@lecture)
end


  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    @lecture.destroy
    respond_to do |format|
      format.html { redirect_to lectures_url, notice: 'Lecture was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params.require(:lecture).permit(:my_file)
    end
end
