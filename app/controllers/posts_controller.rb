class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :date_filter, only: %i[index]
  before_action :set_topic, except: %i[index]
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:status]
  def index
    if params.key? :topic_id
      set_topic
      @posts=@topic.posts.order(created_at: :desc)
    else
      date_from = @f_date
      date_to = @t_date
      @posts = Post.date_filter(date_from,date_to).page(params[:page])
    end
  end

  def show
    @tags = @post.tags.order(:name)
    @topic=Topic.find(params[:topic_id])
    @post=@topic.posts.find(params[:id])
    @comments = @post.comments.all
  end

  def new
    @post = @topic.posts.new
  end

  def edit
  end

  def status
    @post = @topic.posts.find(params[:id])
    unless @post.users.ids.include?current_user.id
      @post.user << current_user
    end
  end

  def create
    @post = @topic.posts.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.js
        format.html { redirect_to topic_post_url(@topic ,@post), notice: "Post was successfully created." }
        format.json { render :index, status: :created, location: @post }
      else
        format.js
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update
        format.html { redirect_to topic_post_url(@topic ,@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to topic_posts_url(@topic), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_post
      @post = @topic.posts.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:topic_id,:name, :description,:tags, :image,:user_id,:posted_at)
    end

    def set_topic
      @topic=Topic.find(params[:topic_id])
    end

    def set_tag
      @tags=Tag.order(:name)
    end

    def grab_updated_tags
      # Adding selected tags.
      tags = params.dig(:post, :tag_ids)
                   .reject(&:blank?)
                   .collect { |tag_id| Tag.find(tag_id) }

      # Adding new tags.
      tags += params.dig(:post, :new_tags)
                    .split
                    .collect { |tag| Tag.find_or_create_by({ name: tag.strip.downcase }) }

      tags.uniq       
    
    end

    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_user_session_path, notice: "Please Login to view that page!"
      end
    end

    def date_filter
      if params[:from].present?
        @f_date= params[:from]
        @t_date= params[:to]
      else
        @f_date=10.days.ago.to_date
        @t_date=Date.today
      end
    end
end
