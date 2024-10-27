require "test_helper"

class JobListingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_listing = job_listings(:one)
  end

  test "should get index" do
    get job_listings_url
    assert_response :success
  end

  test "should get new" do
    get new_job_listing_url
    assert_response :success
  end

  test "should create job_listing" do
    assert_difference("JobListing.count") do
      post job_listings_url, params: { job_listing: { company_id: @job_listing.company_id, description: @job_listing.description, education_requirements: @job_listing.education_requirements, experience_level_id: @job_listing.experience_level_id, interview_process: @job_listing.interview_process, job_benefits: @job_listing.job_benefits, job_category_id: @job_listing.job_category_id, job_duration: @job_listing.job_duration, job_function: @job_listing.job_function, job_reference_id: @job_listing.job_reference_id, job_status: @job_listing.job_status, job_type_id: @job_listing.job_type_id, keywords: @job_listing.keywords, location: @job_listing.location, relocation_assistance: @job_listing.relocation_assistance, remote: @job_listing.remote, remote_work_requirements: @job_listing.remote_work_requirements, salary_range: @job_listing.salary_range, skills: @job_listing.skills, title: @job_listing.title, visa_sponsorship: @job_listing.visa_sponsorship, work_hours: @job_listing.work_hours } }
    end

    assert_redirected_to job_listing_url(JobListing.last)
  end

  test "should show job_listing" do
    get job_listing_url(@job_listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_listing_url(@job_listing)
    assert_response :success
  end

  test "should update job_listing" do
    patch job_listing_url(@job_listing), params: { job_listing: { company_id: @job_listing.company_id, description: @job_listing.description, education_requirements: @job_listing.education_requirements, experience_level_id: @job_listing.experience_level_id, interview_process: @job_listing.interview_process, job_benefits: @job_listing.job_benefits, job_category_id: @job_listing.job_category_id, job_duration: @job_listing.job_duration, job_function: @job_listing.job_function, job_reference_id: @job_listing.job_reference_id, job_status: @job_listing.job_status, job_type_id: @job_listing.job_type_id, keywords: @job_listing.keywords, location: @job_listing.location, relocation_assistance: @job_listing.relocation_assistance, remote: @job_listing.remote, remote_work_requirements: @job_listing.remote_work_requirements, salary_range: @job_listing.salary_range, skills: @job_listing.skills, title: @job_listing.title, visa_sponsorship: @job_listing.visa_sponsorship, work_hours: @job_listing.work_hours } }
    assert_redirected_to job_listing_url(@job_listing)
  end

  test "should destroy job_listing" do
    assert_difference("JobListing.count", -1) do
      delete job_listing_url(@job_listing)
    end

    assert_redirected_to job_listings_url
  end
end
