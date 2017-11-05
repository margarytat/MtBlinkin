class CreateAlerts < ActiveRecord::Migration[5.1]
  def change
    create_table :alert_alerts do |t|
      t.string :apiotics_instance
      t.string :name
      t.timestamps
    end
  end
end