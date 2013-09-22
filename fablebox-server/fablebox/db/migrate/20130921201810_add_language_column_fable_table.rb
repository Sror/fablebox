class AddLanguageColumnFableTable < ActiveRecord::Migration
  def self.up
    add_column :fable, :language, :string
  end
end
