class CreateWeathers < ActiveRecord::Migration[5.0]
  def change
    create_table :weathers do |t|
      t.string :temperature
      t.string :currentdate
      t.string :currenttime

      t.timestamps
    end
  end
end
