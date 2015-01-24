class RidesController < ApplicationController
	before_action :set_ride, only: [:show, :edit, :update, :destroy, :accept]
	before_action :authenticate_user!, except:[:index, :show]

	# GET /rides
	# GET /rides.json
	def index
		@rides = Ride.all

		@rides_source = @rides.uniq.pluck(:source)
		@rides_destination = @rides.uniq.pluck(:destination)

		# conditions = {}
		# conditions[:source] = params[:leaving_from] if params[:leaving_from].present?
		# conditions[:destination] = params[:going_to] if params[:going_to].present?
		# @rides = Ride.where(conditions)

		@rides = get_rides(search_params)

		@requests = Request.all
		@requests_hash = Hash[*Request.all.collect {|it| [it.ride_id, it.passenger_id]}.flatten]


	end

	# GET /rides/1
	# GET /rides/1.json
	def show
	end

	# GET /rides/new
	def new
		@ride = current_user.rides.new
	end

	def accept
		ride = Ride.find(params[:ride_id])
		if ride.spots_taken < ride.spots_available
			@ride.increment!(:spots_taken)      
			@request =  Request.find_by_id(params[:request_id])
			@request.update_attribute(:accept, 'true')
			redirect_to requests_path, notice: 'Passenger request was accepted'
		else
			redirect_to requests_path, alert: 'Ride is already full'
		end  
	end

	# GET /rides/1/edit
	def edit 
		if current_user.id == @ride.user_id
			render :edit 
		else
			redirect_to rides_path, alert: 'You can only change the rideshares you created.'
		end
	end

	# POST /rides
	# POST /rides.json
	def create
		@ride = current_user.rides.new(ride_params)

		respond_to do |format|
			if @ride.save
				format.html { redirect_to rides_path, notice: 'Ride was successfully created.' }
				format.json { render :show, status: :created, location: @ride }
			else
				format.html { render :new }
				format.json { render json: @ride.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /rides/1
	# PATCH/PUT /rides/1.json
	def update
		if current_user.id == @ride.user_id
			respond_to do |format|
				if @ride.update(ride_params)
					format.html { redirect_to rides_path, notice: 'Ride was successfully updated.' }
					format.json { render :show, status: :ok, location: @ride }
				else
					format.html { render :edit }
					format.json { render json: @ride.errors, status: :unprocessable_entity }
				end
			end
		else
			respond_to do |format|
				format.html { redirect_to rides_path, alert: 'You can only change the rideshares you created.' }
				format.json { render json: @ride.errors, status: :unprocessable_entity }
			end  
		end
	end

	# DELETE /rides/1
	# DELETE /rides/1.json
	def destroy
		if current_user.id == @ride.user_id
			@ride.destroy
			respond_to do |format|
				format.html { redirect_to rides_url, notice: 'Ride was successfully destroyed.' }
				format.json { head :no_content }
			end
		else
			respond_to do |format|
				format.html { redirect_to rides_path, alert: 'You can only delete rideshares you created.' }
				format.json { render json: @ride.errors, status: :unprocessable_entity }
			end  
		end        
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_ride
			@ride = Ride.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def ride_params
			params.require(:ride).permit(:user_id, :driver, :source, :destination, :description, :spots_available, :spots_taken, :leaving_time, :leaving_date, :price, :accept)
		end

		def search_params
			params.permit(:leaving_from, :going_to)
			params_hash = {'required' => { 'source' => params[:leaving_from], 'destination' => params[:going_to]}}
		end

		def get_rides(params) 

			possible_combination = [] 
			conditions = {}
			key_array = params['required'].keys

			possible_combination = (possible_combination + key_array.combination(key_array.length).to_a).flatten

			possible_combination.each do |comb|
				conditions[comb] = params['required'][comb] if params['required'][comb].present?
			end  

			Ride.where(conditions)
		end


end
