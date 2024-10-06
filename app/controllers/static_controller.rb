class StaticController < ApplicationController
  skip_before_action :set_turbo_frame_request_variant

  def home
  end

  def about
  end

  def contact
  end

  def faq
  end
end
