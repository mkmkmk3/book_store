# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Controllers::ErrorHandling if Rails.env.production?
end
