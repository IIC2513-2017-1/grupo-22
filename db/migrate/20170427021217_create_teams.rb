class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.string :logo
      t.string :trainer
      t.date :foundation_date
      
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
