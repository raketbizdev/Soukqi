require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Jobs"
  end

  test "should create job" do
    visit jobs_url
    click_on "New job"

    fill_in "Company", with: @job.company_id
    fill_in "Description", with: @job.description
    fill_in "Education requirements", with: @job.education_requirements
    fill_in "Experience level", with: @job.experience_level_id
    fill_in "Interview process", with: @job.interview_process
    fill_in "Job benefits", with: @job.job_benefits
    fill_in "Job category", with: @job.job_category_id
    fill_in "Job duration", with: @job.job_duration
    fill_in "Job function", with: @job.job_function
    fill_in "Job reference", with: @job.job_reference_id
    fill_in "Job status", with: @job.job_status
    fill_in "Job type", with: @job.job_type_id
    fill_in "Keywords", with: @job.keywords
    fill_in "Location", with: @job.location
    check "Relocation assistance" if @job.relocation_assistance
    check "Remote" if @job.remote
    fill_in "Remote work requirements", with: @job.remote_work_requirements
    fill_in "Salary range", with: @job.salary_range
    fill_in "Skills", with: @job.skills
    fill_in "Title", with: @job.title
    check "Visa sponsorship" if @job.visa_sponsorship
    fill_in "Work hours", with: @job.work_hours
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "should update Job" do
    visit job_url(@job)
    click_on "Edit this job", match: :first

    fill_in "Company", with: @job.company_id
    fill_in "Description", with: @job.description
    fill_in "Education requirements", with: @job.education_requirements
    fill_in "Experience level", with: @job.experience_level_id
    fill_in "Interview process", with: @job.interview_process
    fill_in "Job benefits", with: @job.job_benefits
    fill_in "Job category", with: @job.job_category_id
    fill_in "Job duration", with: @job.job_duration
    fill_in "Job function", with: @job.job_function
    fill_in "Job reference", with: @job.job_reference_id
    fill_in "Job status", with: @job.job_status
    fill_in "Job type", with: @job.job_type_id
    fill_in "Keywords", with: @job.keywords
    fill_in "Location", with: @job.location
    check "Relocation assistance" if @job.relocation_assistance
    check "Remote" if @job.remote
    fill_in "Remote work requirements", with: @job.remote_work_requirements
    fill_in "Salary range", with: @job.salary_range
    fill_in "Skills", with: @job.skills
    fill_in "Title", with: @job.title
    check "Visa sponsorship" if @job.visa_sponsorship
    fill_in "Work hours", with: @job.work_hours
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "should destroy Job" do
    visit job_url(@job)
    click_on "Destroy this job", match: :first

    assert_text "Job was successfully destroyed"
  end
end
