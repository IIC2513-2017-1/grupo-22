class CreateForos < ActiveRecord::Migration[5.0]
  def change
    create_table :foros do |t|
      t.belongs_to :tourney, index:{ unique: true }
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
