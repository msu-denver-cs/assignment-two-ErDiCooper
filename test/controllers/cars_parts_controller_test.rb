require 'test_helper'

class CarsPartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cars_part = cars_parts(:one)
  end

  test "should get index" do
    get cars_parts_url, as: :json
    assert_response :success
  end

  test "should create cars_part" do
    assert_difference('CarsPart.count') do
      post cars_parts_url, params: { cars_part: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show cars_part" do
    get cars_part_url(@cars_part), as: :json
    assert_response :success
  end

  test "should update cars_part" do
    patch cars_part_url(@cars_part), params: { cars_part: {  } }, as: :json
    assert_response 200
  end

  test "should destroy cars_part" do
    assert_difference('CarsPart.count', -1) do
      delete cars_part_url(@cars_part), as: :json
    end

    assert_response 204
  end
end
