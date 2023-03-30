# frozen_string_literal: true

class TreesController < ApplicationController
  include Pagy::Backend

  def index
    pagy, records = pagy(Tree.all.order(order), items: index_params[:items])
    trees = TreeSerializer.new(records).serializable_hash
    trees[:data].map! { |t| t[:attributes] }
    render json: { pagination: pagy_metadata(pagy), **trees }
  end

  private

  def index_params
    params.permit(:count, :random, :page, :items)
  end

  def order = @order ||= index_params.key?(:random) ? 'RANDOM()' : 1
end
