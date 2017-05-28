class AddBracketCodeToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :bracket_code, :string
  end
end
