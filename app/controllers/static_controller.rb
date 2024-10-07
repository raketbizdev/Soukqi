class StaticController < ApplicationController
  skip_before_action :set_turbo_frame_request_variant
  layout "inner_app", only: [ :dashboard ]

  def home
  end

  def about
  end

  def contact
  end

  def faq
  end
  def dashboard
    # Optional: Add any logic needed for the dashboard here.
  end
end
