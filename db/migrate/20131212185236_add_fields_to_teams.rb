class AddFieldsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :clue, :string
    add_column :teams, :seconds, :int, null: false, default: 0
    add_column :teams, :skips, :int, null: false, default: 0
  end
end
