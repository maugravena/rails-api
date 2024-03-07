class PoliciesController < ApplicationController
  def show
    @policy = Policy.find(params[:policy_id])

    render json: @policy
  end

  def create
    @policy = Policy.new(params)

    render json: @policy, status: :creted if @policy.save
  end
end
