# frozen_string_literal: true

class TreesController < ApplicationController
  private

  def setup
    @model = Tree
    @serializer = TreeSerializer
  end
end
