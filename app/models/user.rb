class User < ActiveRecord::Base
  has_many :products, through: :referrals
  has_many :referrals
  validates_uniqueness_of :email

  def create_referrals_for_product(url)
    p_name = url.split('/')[-1].gsub('-',' ')
    code = SecureRandom.urlsafe_base64(6)
    product = Product.find_or_create_by!(name: p_name)
    begin
      referrals.create!(code: code, url: url, product: product)
    rescue ActiveRecord::RecordInvalid
      referrals.where(user_id: id, product_id: product.id).first
    end
  end
end
