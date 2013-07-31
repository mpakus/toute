class ToutsController < ApplicationController
  before_action :set_tout, only: [:show, :edit, :update, :destroy]

  # GET /touts
  # GET /touts.json
  def index
    @touts = Tout.published
  end

  # GET /touts/1
  # GET /touts/1.json
  def show
  end

  # GET /touts/new
  def new
    @tout = Tout.new
    @tout.save
    redirect_to edit_tout_path(@tout.id)
  end

  # GET /touts/1/edit
  def edit
  end

  # POST /touts
  # POST /touts.json
  def create
    @tout = Tout.new(tout_params)
    @tout.operation = Operation.find(params[:tout][:operation_id]) if params[:tout][:operation_id]
    @tout.category = Category.find(params[:tout][:category_id]) if params[:tout][:category_id]
    @tout.city = City.find(params[:tout][:city_id]) if params[:tout][:city_id]

    respond_to do |format|
      if @tout.save
        format.html { redirect_to @tout, notice: 'Tout was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tout }
      else
        format.html { render action: 'new' }
        format.json { render json: @tout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /touts/1
  # PATCH/PUT /touts/1.json
  def update
    if params["prepare"]
      @tout.prepare
    elsif params["publish"]
      @tout.publish
    elsif params["unpublish"]
      @tout.unpublish
    end

    respond_to do |format|
      if @tout.update(tout_params)
        format.html { redirect_to @tout, notice: "Объявление успешно #{@tout.state}" }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /touts/1
  # DELETE /touts/1.json
  def destroy
    @tout.destroy
    respond_to do |format|
      format.html { redirect_to touts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tout
      @tout = Tout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tout_params
      #params.require(:tout).permit(:name, :content, :category_id, :city_id, :user_id, :deleted, operation_attributes: [:id, :alias, :name])
      params.require(:tout).permit(:name, :content, :category_id, :city_id, :user_id, :deleted, :operation_id)
    end
end
