class AddLogoToTeams < ActiveRecord::Migration[5.0]
  def self.up
    remove_column :teams, :logo

    change_table :teams do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :teams, :logo

    change_table :teams do |t|
      t.string :logo
    end
  end
end
