class AddPhotoToPlayers < ActiveRecord::Migration[5.0]
  def self.up
    remove_column :players, :phote

    change_table :players do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :players, :photo

    change_table :players do |t|
      t.string :phote
    end
  end
end
