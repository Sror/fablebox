class PurchasedFable < ActiveRecord::Base

  self.table_name = 'purchased_fable'

  validates :date_purchased, presence: true

  belongs_to :user
  belongs_to :fable

end
