require 'test_helper'

class RidesControllerTest < ActionController::TestCase
  setup do
    @ride = rides(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rides)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ride" do
    assert_difference('Ride.count') do
      post :create, ride: { destination: @ride.destination, driver: @ride.driver, passenger1: @ride.passenger1, passenger2: @ride.passenger2, passenger3: @ride.passenger3, passenger4: @ride.passenger4, passenger5: @ride.passenger5, passenger6: @ride.passenger6, passenger7: @ride.passenger7, source: @ride.source, spots_available: @ride.spots_available, spots_taken: @ride.spots_taken }
    end

    assert_redirected_to ride_path(assigns(:ride))
  end

  test "should show ride" do
    get :show, id: @ride
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ride
    assert_response :success
  end

  test "should update ride" do
    patch :update, id: @ride, ride: { destination: @ride.destination, driver: @ride.driver, passenger1: @ride.passenger1, passenger2: @ride.passenger2, passenger3: @ride.passenger3, passenger4: @ride.passenger4, passenger5: @ride.passenger5, passenger6: @ride.passenger6, passenger7: @ride.passenger7, source: @ride.source, spots_available: @ride.spots_available, spots_taken: @ride.spots_taken }
    assert_redirected_to ride_path(assigns(:ride))
  end

  test "should destroy ride" do
    assert_difference('Ride.count', -1) do
      delete :destroy, id: @ride
    end

    assert_redirected_to rides_path
  end
end
