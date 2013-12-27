class ToutsController < ApplicationController
  before_action :set_tout, only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumb, only: [:index, :new, :show]

  def index
    @touts = Tout.filter_by(operation: params[:operation], city: params[:city], string: params[:string]).page(params[:page]).per(2)
  end

  # GET /touts/1
  # GET /touts/1.json
  def show
  end

  # GET /touts/new
  def new
    @tout = Tout.new
  end

  # GET /touts/1/edit
  def edit
  end

  # POST /touts
  # POST /touts.json
  def create

    @tout           = Tout.new(tout_params)
    @tout.operation = Operation.find(params[:tout][:operation_id]) if params[:tout][:operation_id]
    @tout.category  = Category.find(params[:tout][:category_id]) if params[:tout][:category_id]
    @tout.city      = City.find(params[:tout][:city_id]) if params[:tout][:city_id]
    @tout.approved  = true
    @tout.user      = current_user()

    respond_to do |format|
      if @tout.save
        upload_photos(6)
        format.html { redirect_to touts_path, notice: t('touts.created') }
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
    respond_to do |format|
      if @tout.update(tout_params)
        format.html { redirect_to @tout, notice: 'Tout was successfully updated.' }
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
    ##
    # Upload number of images
    def upload_photos(num)
      (1..num).each do |i|
        name = "image#{i}"
        @tout.photos << Photo.new(image: params[:tout][name.to_sym]) unless params[:tout][name.to_sym].nil?
      end
    end

    def set_breadcrumb
      add_breadcrumb t('touts.list'), touts_path(operation: params[:operation], city: params[:city], category: params[:category])
      unless params[:city].blank?
        @city = City.where(alias: params[:city]).first
        add_breadcrumb @city.name, touts_path(operation: params[:operation], city: @city.alias, category: params[:category])
      end
      unless params[:operation].blank?
        @operation = Operation.where(alias: params[:operation]).first
        add_breadcrumb @operation.name, touts_path(operation: @operation.alias, city: params[:city], category: params[:category])
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_tout
      @tout = Tout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tout_params
      #params.require(:tout).permit(:name, :content, :category_id, :city_id, :user_id, :deleted, operation_attributes: [:id, :alias, :name])
      params.require(:tout).permit(:name, :content, :category_id, :city_id, :deleted, :operation_id)
    end
end
