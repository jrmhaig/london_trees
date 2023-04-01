# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :setup

  include Pagy::Backend

  def index
    pagy, raw_records = pagy(@model.all.order(order), items: index_params[:items])
    records = @serializer.new(raw_records).serializable_hash
    records[:data].map! { |t| t[:attributes] }

    render json: { pagination: pagy_metadata(pagy), **records }
  end

  private

  def index_params
    params.permit(:count, :random, :page, :items)
  end

  def order = @order ||= index_params.key?(:random) ? 'RANDOM()' : 1
end
