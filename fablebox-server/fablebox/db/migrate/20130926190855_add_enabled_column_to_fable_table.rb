class AddEnabledColumnToFableTable < ActiveRecord::Migration
  def self.up
    add_column :fable, :enabled, :boolean
  end
end
