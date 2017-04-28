class RenameTorneysToTourneys < ActiveRecord::Migration[5.0]
  def change
    rename_table :torneys, :tourneys
  end
end
