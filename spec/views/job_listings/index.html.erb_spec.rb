require 'rails_helper'

RSpec.describe "job_listings/index", type: :view do
  let(:company) { create(:company) }

  before do
    assign(:company, company)
    assign(:job_listings, [
      create(:job_listing, company: company, title: "Software Engineer"),
      create(:job_listing, company: company, title: ""),
      create(:job_listing, company: company, title: nil)
    ])
  end

  it "renders job listing titles correctly" do
    render

    expect(rendered).to have_content("Software Engineer")
    expect(rendered).to have_content("No title")
    expect(rendered).to have_content("No title")
    expect(rendered).not_to have_content("<td></td>")
  end
end
