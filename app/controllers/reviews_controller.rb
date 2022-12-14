class ReviewsController < ApplicationController
  before_action :set_topic_post
  before_action :set_review, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /reviews or /reviews.json
  def index
    @reviews = @post.reviews.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = @post.reviews.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = @post.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to topic_post_url(@topic,@post), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to topic_post_url(@topic,@post), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy

    respond_to do |format|
      format.html {redirect_to topic_post_url(@topic,@post), notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:rating,:post_id)
    end

    def set_topic_post
      @topic=Topic.find(params[:topic_id])
      @post=@topic.posts.find(params[:post_id])
    end

    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_user_session_path, notice: "Please Login to view that page!"
      end
    end

end
