class CreateTorneys < ActiveRecord::Migration[5.0]
  def change
    create_table :torneys do |t|
      t.string :name
      t.text :description
      t.string :format
      t.string :location
      t.date :inscription_limit_date
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
