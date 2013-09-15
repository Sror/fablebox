class CreateFables < ActiveRecord::Migration
  def change
    create_table :fable do |t|
      t.string :guid
      t.string :name
      t.date :date_added
      t.integer :length_in_sec
      t.integer :is_paid

      t.timestamps
    end
  end
end
