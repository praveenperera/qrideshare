class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy, :bookings]
  before_action :authenticate_user!
  before_action :require_permission, except: [:index, :new, :create]


  # GET /requests
  # GET /requests.json
  def index
    @incoming_requests = Request.where(:user_id => current_user.id).where.not(:ignore => 'true', :accept => 'true')
    @outgoing_requests = Request.where(:passenger_id => current_user.id)
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  # def edit
  # end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to rides_path, notice: 'Ride request was sent successfully.' }
        format.json { render :show, status: :created, location: @request}
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to requests_path, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def bookings
    redirect_to requests_path, notice: 'Bookings route working'
  end  
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:user_id, :ride_id, :passenger, :ignore, :passenger_id, :accept)
    end

    def require_permission
      if current_user.id != Request.find(params[:id]).user_id
        redirect_to requests_path, alert: "You're only allowed to edit your own requests"
      end
    end

end
