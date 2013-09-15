class User < ActiveRecord::Base

  self.table_name = 'user'

  #validates :apple_id, :push_id, allow_nil:true
  #validates :apple_id, uniqueness: true

  has_many :purchased_fables
  has_many :fables, through: :purchased_fables

end
