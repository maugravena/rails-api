require_relative '../../config/environment'
require 'sneakers'

class CreatePolicyWorker
  include Sneakers::Worker

  from_queue 'minha.fila.teste'

  def work(msg)
    return ack! if msg.blank?

    Rails.logger.info("Received message: #{msg}")

    payload = JSON.parse(msg)
    Rails.logger.info("Parsed payload: #{payload}")
    ActiveRecord::Base.transaction do
      @vehicle = Vehicle.new(payload["vehicle"])
      @insured = Insured.new(payload["insured"])
      @policy = Policy.new(
        emission_date: payload["emission_date"],
        end_date_coverage: payload["end_date_coverage"],
        vehicle: @vehicle,
        insured: @insured
      )

      @policy.save!
      Rails.logger.info("Policy created: #{@policy.policy_id}")
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error(e.record.errors.full_message)
    end

    ack!
  end
end
