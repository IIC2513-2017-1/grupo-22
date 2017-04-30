class AddDetailsToTourneys < ActiveRecord::Migration[5.0]
  def change
    add_column :tourneys, :schedule, :time
    add_column :tourneys, :prize, :text
    add_column :tourneys, :price, :string
    add_column :tourneys, :mail, :string
    add_column :tourneys, :phone, :string
  end
end
