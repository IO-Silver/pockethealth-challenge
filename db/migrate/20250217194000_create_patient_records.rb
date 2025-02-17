class CreatePatientRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :patient_records, id: false do |t|
      t.uuid :id, primary_key: true

      t.timestamps
    end
  end
end
