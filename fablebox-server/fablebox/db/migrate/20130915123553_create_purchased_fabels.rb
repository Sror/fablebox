class CreatePurchasedFabels < ActiveRecord::Migration
  def change
    create_table :purchased_fable do |t|
      t.belongs_to :user
      t.belongs_to :fable
      t.date :date_purchased

      t.timestamps
    end
  end
end
