class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email, null: false
      t.string :username, null: false
      t.string :password, null: false

      t.timestamps
    end
  end
end
