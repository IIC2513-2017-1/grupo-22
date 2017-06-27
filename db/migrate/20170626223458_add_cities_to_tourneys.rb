class AddCitiesToTourneys < ActiveRecord::Migration[5.0]
  def change
  	add_column :tourneys, :city, :string
  	Tourney.update_all(city: 'Santiago')
  end
end
