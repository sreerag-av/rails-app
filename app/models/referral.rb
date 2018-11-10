class Referral < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates_uniqueness_of :code
  validates :user_id, :uniqueness => { :scope => :product_id }

  accepts_nested_attributes_for :product
end
