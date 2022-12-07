class CmreviewsController < ApplicationController
  before_action :set_cmreview, only: %i[ show edit update destroy ]

  # GET /cmreviews or /cmreviews.json
  def index
    @cmreviews = Cmreview.all
  end

  # GET /cmreviews/1 or /cmreviews/1.json
  def show
  end

  # GET /cmreviews/new
  def new
    @cmreview = Cmreview.new
  end

  # GET /cmreviews/1/edit
  def edit
  end

  # POST /cmreviews or /cmreviews.json
  def create
    @cmreview = Cmreview.new(cmreview_params)

    respond_to do |format|
      if @cmreview.save
        format.html { redirect_to cmreview_url(@cmreview), notice: "Cmreview was successfully created." }
        format.json { render :show, status: :created, location: @cmreview }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cmreview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cmreviews/1 or /cmreviews/1.json
  def update
    respond_to do |format|
      if @cmreview.update(cmreview_params)
        format.html { redirect_to cmreview_url(@cmreview), notice: "Cmreview was successfully updated." }
        format.json { render :show, status: :ok, location: @cmreview }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cmreview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cmreviews/1 or /cmreviews/1.json
  def destroy
    @cmreview.destroy

    respond_to do |format|
      format.html { redirect_to cmreviews_url, notice: "Cmreview was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cmreview
      @cmreview = Cmreview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cmreview_params
      params.require(:cmreview).permit(:star)
    end
end
