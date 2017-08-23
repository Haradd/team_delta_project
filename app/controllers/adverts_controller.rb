class AdvertsController < ApplicationController
  before_action :set_advert, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[show index]
  before_action :check_advert_belongs_to_current_user, only: %i[edit update destroy]

  # GET /adverts
  # GET /adverts.json
  def index
    @adverts = Advert.all
    @adverts = @adverts.by_advert_type(search_params[:advert_type])
    @adverts = @adverts.by_job_type(search_params[:job_type])
    @adverts = @adverts.by_city(search_params[:city])
    @adverts = @adverts.by_price(search_params[:price])
    @adverts = @adverts.paginate(page: params[:page], per_page: 5)
  end

  # GET /adverts/1
  # GET /adverts/1.json
  def show; end

  # GET /adverts/new
  def new
    @advert = current_user.adverts.build
  end

  # GET /adverts/1/edit
  def edit; end

  # POST /adverts
  # POST /adverts.json
  def create
    @advert = current_user.adverts.build(advert_params)

    respond_to do |format|
      if @advert.save
        format.html { redirect_to @advert, notice: "Advert was successfully created." }
        format.json { render :show, status: :created, location: @advert }
      else
        format.html { render :new }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adverts/1
  # PATCH/PUT /adverts/1.json
  def update
    respond_to do |format|
      if @advert.update(advert_params)
        format.html { redirect_to @advert, notice: "Advert was successfully updated." }
        format.json { render :show, status: :ok, location: @advert }
      else
        format.html { render :edit }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adverts/1
  # DELETE /adverts/1.json
  def destroy
    @advert.destroy
    respond_to do |format|
      format.html { redirect_to adverts_url, notice: "Advert was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def search_params
    params.permit(search: %i[advert_type job_type city price]).fetch(:search, {})
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_advert
    @advert = Advert.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def advert_params
    params.require(:advert)
          .permit(:advert_type, :title, :description, :city, :street, :phone,
                  :price, :job_type, :advert_type, locations_attributes:
                  %i[id address destroy])
  end

  def check_advert_belongs_to_current_user
    @advert = current_user.adverts.find_by(id: params[:id])
    redirect_to adverts_path, notice: "Hey, that is not your advert!" if @advert.nil?
  end
end
