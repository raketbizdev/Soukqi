require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_job_url
    assert_response :success
  end

  test "should create job" do
    assert_difference("Job.count") do
      post jobs_url, params: { job: { company_id: @job.company_id, description: @job.description, education_requirements: @job.education_requirements, experience_level_id: @job.experience_level_id, interview_process: @job.interview_process, job_benefits: @job.job_benefits, job_category_id: @job.job_category_id, job_duration: @job.job_duration, job_function: @job.job_function, job_reference_id: @job.job_reference_id, job_status: @job.job_status, job_type_id: @job.job_type_id, keywords: @job.keywords, location: @job.location, relocation_assistance: @job.relocation_assistance, remote: @job.remote, remote_work_requirements: @job.remote_work_requirements, salary_range: @job.salary_range, skills: @job.skills, title: @job.title, visa_sponsorship: @job.visa_sponsorship, work_hours: @job.work_hours } }
    end

    assert_redirected_to job_url(Job.last)
  end

  test "should show job" do
    get job_url(@job)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_url(@job)
    assert_response :success
  end

  test "should update job" do
    patch job_url(@job), params: { job: { company_id: @job.company_id, description: @job.description, education_requirements: @job.education_requirements, experience_level_id: @job.experience_level_id, interview_process: @job.interview_process, job_benefits: @job.job_benefits, job_category_id: @job.job_category_id, job_duration: @job.job_duration, job_function: @job.job_function, job_reference_id: @job.job_reference_id, job_status: @job.job_status, job_type_id: @job.job_type_id, keywords: @job.keywords, location: @job.location, relocation_assistance: @job.relocation_assistance, remote: @job.remote, remote_work_requirements: @job.remote_work_requirements, salary_range: @job.salary_range, skills: @job.skills, title: @job.title, visa_sponsorship: @job.visa_sponsorship, work_hours: @job.work_hours } }
    assert_redirected_to job_url(@job)
  end

  test "should destroy job" do
    assert_difference("Job.count", -1) do
      delete job_url(@job)
    end

    assert_redirected_to jobs_url
  end
end
