class UsercommentratingsController < ApplicationController
  before_action :set_usercommentrating, only: %i[ show edit update destroy ]
  #before_action :set_usercomment
  # GET /usercommentratings or /usercommentratings.json
  def index
    default_ratings = Hash[(1..5).reverse_each.map { |n| [n, 0] }]
    @usercommentratings = Usercommentrating.all
    @ratings = default_ratings.merge.usercommentrating.star.group(:star).count
  end

  # GET /usercommentratings/1 or /usercommentratings/1.json
  def show
  end

  # GET /usercommentratings/new
  def new
    @usercommentrating = Usercommentrating.new
  end

  # GET /usercommentratings/1/edit
  def edit
  end

  # POST /usercommentratings or /usercommentratings.json
  def create
    @usercommentrating = Usercommentrating.new(usercommentrating_params)
    @usercommentrating.user_id = current_user.id
    @usercommentrating.comment_id = 1
    

    respond_to do |format|
      if @usercommentrating.save
        format.html { redirect_to usercommentrating_url(@usercommentrating), notice: "Usercommentrating was successfully created." }
        format.json { render :show, status: :created, location: @usercommentrating }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @usercommentrating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usercommentratings/1 or /usercommentratings/1.json
  def update
    respond_to do |format|
      if @usercommentrating.update(usercommentrating_params)
        format.html { redirect_to usercommentrating_url(@usercommentrating), notice: "Usercommentrating was successfully updated." }
        format.json { render :show, status: :ok, location: @usercommentrating }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @usercommentrating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usercommentratings/1 or /usercommentratings/1.json
  def destroy
    @usercommentrating.destroy

    respond_to do |format|
      format.html { redirect_to usercommentratings_url, notice: "Usercommentrating was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usercommentrating
      @usercommentrating = Usercommentrating.find(params[:id])
    end

    def set_usercomment
      @topic=Topic.find(params[:topic_id])
      @post=@topic.posts.find(params[:post_id])
      #@comment= @post.comments.find(params[:comment_id])
      #@usercommentrating.user_id= current_user.id
    end

    # Only allow a list of trusted parameters through.
    def usercommentrating_params
      params.require(:usercommentrating).permit(:star,:comment_id,:user_id)
    end
end
