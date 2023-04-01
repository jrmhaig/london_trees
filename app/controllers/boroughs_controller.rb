# frozen_string_literal: true

class BoroughsController < ApplicationController
  private

  def setup
    @model = Borough
    @serializer = BoroughSerializer
  end
end
