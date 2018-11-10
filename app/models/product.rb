class Product < ActiveRecord::Base
  has_many :users, through: :referrals
  has_many :referrals
  validates_uniqueness_of :name
end
