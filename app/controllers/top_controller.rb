# frozen_string_literal: true

class TopController < ApplicationController
  def index
    @test = 10
    binding.pry
  end
end

