require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_url
    assert_response :success
  end

  test "should create profile" do
    assert_difference("Profile.count") do
      post profiles_url, params: { profile: { address: @profile.address, bio: @profile.bio, city: @profile.city, country: @profile.country, date_of_birth: @profile.date_of_birth, first_name: @profile.first_name, last_name: @profile.last_name, phone_number: @profile.phone_number, postal_code: @profile.postal_code, state: @profile.state, user_id: @profile.user_id } }
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test "should show profile" do
    get profile_url(@profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { address: @profile.address, bio: @profile.bio, city: @profile.city, country: @profile.country, date_of_birth: @profile.date_of_birth, first_name: @profile.first_name, last_name: @profile.last_name, phone_number: @profile.phone_number, postal_code: @profile.postal_code, state: @profile.state, user_id: @profile.user_id } }
    assert_redirected_to profile_url(@profile)
  end

  test "should destroy profile" do
    assert_difference("Profile.count", -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to profiles_url
  end
end
