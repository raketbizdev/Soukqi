require "application_system_test_case"

class JobListingsTest < ApplicationSystemTestCase
  setup do
    @job_listing = job_listings(:one)
  end

  test "visiting the index" do
    visit job_listings_url
    assert_selector "h1", text: "Job listings"
  end

  test "should create job listing" do
    visit job_listings_url
    click_on "New job listing"

    fill_in "Company", with: @job_listing.company_id
    fill_in "Description", with: @job_listing.description
    fill_in "Education requirements", with: @job_listing.education_requirements
    fill_in "Experience level", with: @job_listing.experience_level_id
    fill_in "Interview process", with: @job_listing.interview_process
    fill_in "Job benefits", with: @job_listing.job_benefits
    fill_in "Job category", with: @job_listing.job_category_id
    fill_in "Job duration", with: @job_listing.job_duration
    fill_in "Job function", with: @job_listing.job_function
    fill_in "Job reference", with: @job_listing.job_reference_id
    fill_in "Job status", with: @job_listing.job_status
    fill_in "Job type", with: @job_listing.job_type_id
    fill_in "Keywords", with: @job_listing.keywords
    fill_in "Location", with: @job_listing.location
    check "Relocation assistance" if @job_listing.relocation_assistance
    check "Remote" if @job_listing.remote
    fill_in "Remote work requirements", with: @job_listing.remote_work_requirements
    fill_in "Salary range", with: @job_listing.salary_range
    fill_in "Skills", with: @job_listing.skills
    fill_in "Title", with: @job_listing.title
    check "Visa sponsorship" if @job_listing.visa_sponsorship
    fill_in "Work hours", with: @job_listing.work_hours
    click_on "Create Job listing"

    assert_text "Job listing was successfully created"
    click_on "Back"
  end

  test "should update Job listing" do
    visit job_listing_url(@job_listing)
    click_on "Edit this job listing", match: :first

    fill_in "Company", with: @job_listing.company_id
    fill_in "Description", with: @job_listing.description
    fill_in "Education requirements", with: @job_listing.education_requirements
    fill_in "Experience level", with: @job_listing.experience_level_id
    fill_in "Interview process", with: @job_listing.interview_process
    fill_in "Job benefits", with: @job_listing.job_benefits
    fill_in "Job category", with: @job_listing.job_category_id
    fill_in "Job duration", with: @job_listing.job_duration
    fill_in "Job function", with: @job_listing.job_function
    fill_in "Job reference", with: @job_listing.job_reference_id
    fill_in "Job status", with: @job_listing.job_status
    fill_in "Job type", with: @job_listing.job_type_id
    fill_in "Keywords", with: @job_listing.keywords
    fill_in "Location", with: @job_listing.location
    check "Relocation assistance" if @job_listing.relocation_assistance
    check "Remote" if @job_listing.remote
    fill_in "Remote work requirements", with: @job_listing.remote_work_requirements
    fill_in "Salary range", with: @job_listing.salary_range
    fill_in "Skills", with: @job_listing.skills
    fill_in "Title", with: @job_listing.title
    check "Visa sponsorship" if @job_listing.visa_sponsorship
    fill_in "Work hours", with: @job_listing.work_hours
    click_on "Update Job listing"

    assert_text "Job listing was successfully updated"
    click_on "Back"
  end

  test "should destroy Job listing" do
    visit job_listing_url(@job_listing)
    click_on "Destroy this job listing", match: :first

    assert_text "Job listing was successfully destroyed"
  end
end
