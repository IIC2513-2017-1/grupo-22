class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :full_name
      t.string :position
      t.string :email
      t.string :address
      t.string :phone
      t.string :birth_date
      t.string :ocupation
      t.string :phote
      t.string :leg
      t.references :team_id, foreign_key: true

      t.timestamps
    end
  end
end
