class LaptopsController < ApplicationController
  before_action :set_laptop, only: [:show, :edit, :update, :destroy]

  # GET /laptops
  # GET /laptops.json
  def index
    @brands = Brand.all
    @brand_name = params[:brand_id]
    @laptops = Laptop.search(params[:search_laptop_name], params[:search_processor], params[:brand_id]).page( params[:page] )
    # if params[:email]
    #   SendDetailMailer.with(user: @user).submission.deliver_now
    #   # SendDetailJob.perform_later
    # end
  end

  def send_detail
    if params[:email]
      SendDetailMailer.with(user: @user).submission.deliver_now
    end
  end

  # GET /laptops/1
  # GET /laptops/1.json
  def show
  end

  # GET /laptops/new
  def new
    @laptop = Laptop.new
  end

  # GET /laptops/1/edit
  def edit
  end

  # POST /laptops
  # POST /laptops.json
  def create
    @laptop = Laptop.new(laptop_params)
    respond_to do |format|
      if @laptop.save
        format.html { redirect_to @laptop, notice: 'Laptop was successfully created.' }
        format.json { render :show, status: :created, location: @laptop }
      else
        format.html { render :new }
        format.json { render json: @laptop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laptops/1
  # PATCH/PUT /laptops/1.json
  def update
    respond_to do |format|
      if @laptop.update(laptop_params)
        format.html { redirect_to @laptop, notice: 'Laptop was successfully updated.' }
        format.json { render :show, status: :ok, location: @laptop }
      else
        format.html { render :edit }
        format.json { render json: @laptop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laptops/1
  # DELETE /laptops/1.json
  def destroy
    @laptop.destroy
    respond_to do |format|
      format.html { redirect_to laptops_url, notice: 'Laptop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_laptop
      @laptop = Laptop.find_by_id(params[:id])
      redirect_to laptops_path, notice: "Laptop not found" if @laptop.blank?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def laptop_params
      params.require(:laptop).permit(:model_number, :name, :serial_number, :ram, 
                                    :hdd, :processor, :weight, :screen, 
                                    :graphics_card, :usb_port, :hdmi_port,
                                    :available, :brand_id, :category_ids, images: [],
                                    laptop_categories_attributes: [:id ,:laptop_id, :category_id, :_destroy ] )
    end

end