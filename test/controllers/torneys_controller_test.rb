require 'test_helper'

class TorneysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @torney = torneys(:one)
  end

  test "should get index" do
    get torneys_url
    assert_response :success
  end

  test "should get new" do
    get new_torney_url
    assert_response :success
  end

  test "should create torney" do
    assert_difference('Torney.count') do
      post torneys_url, params: { torney: { description: @torney.description, end_date: @torney.end_date, format: @torney.format, inscription_limit_date: @torney.inscription_limit_date, location: @torney.location, name: @torney.name, start_date: @torney.start_date } }
    end

    assert_redirected_to torney_url(Torney.last)
  end

  test "should show torney" do
    get torney_url(@torney)
    assert_response :success
  end

  test "should get edit" do
    get edit_torney_url(@torney)
    assert_response :success
  end

  test "should update torney" do
    patch torney_url(@torney), params: { torney: { description: @torney.description, end_date: @torney.end_date, format: @torney.format, inscription_limit_date: @torney.inscription_limit_date, location: @torney.location, name: @torney.name, start_date: @torney.start_date } }
    assert_redirected_to torney_url(@torney)
  end

  test "should destroy torney" do
    assert_difference('Torney.count', -1) do
      delete torney_url(@torney)
    end

    assert_redirected_to torneys_url
  end
end
