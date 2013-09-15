class Fable < ActiveRecord::Base

  self.table_name = 'fable'

  validates :guid, :name, :date_added, :length_in_sec, :is_paid, presence: true
  validates :guid, uniqueness: true

  has_many :purchased_fables
  has_many :users, through: :purchased_fables

end
