class PoliciesController < ApplicationController
  def show
    @policy = Policy.find(params[:policy_id])

    render json: policy(@policy)
  end

  def create
    @policy = Policy.new(params)

    render json: @policy, status: :creted if @policy.save
  end

  private

  def policy(policy)
    {
      policy_id: policy.policy_id,
      emission_date: policy.emission_date,
      end_date_coverage: policy.end_date_coverage,
      insured: {
        name: policy.insured.name,
        cpf: policy.insured.cpf
      },
      vehicle: {
        brand: policy.vehicle.brand,
        model: policy.vehicle.model,
        year: policy.vehicle.license_plate
      }
    }
  end
end
