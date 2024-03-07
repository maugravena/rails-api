class CreatePolicies < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'pgcrypto'

    create_table :policies, id: false, primary_key: :policy_id do |t|
      t.uuid :policy_id, default: -> { "gen_random_uuid()" }, primary_key: true, null: false
      t.date :emission_date
      t.date :end_date_coverage
      t.references :vehicle, null: false, foreign_key: true
      t.references :insured, null: false, foreign_key: true

      t.timestamps
    end
  end
end
