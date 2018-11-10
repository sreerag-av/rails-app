class ReferralsController < ApplicationController

  def serve_product
    r = Referral.find_by(code: params[:id])
    click = r.product.clicks
    r.product.update_attributes(clicks: click += 1)
    @product = r.product
    redirect_to ['/products', @product.name.gsub(' ','-')].join('/')
  end

  def view
    name = params[:name].gsub('-', ' ')
    @product = Product.find_by_name(name)
    view = @product.views
    @product.update_attributes(views: view += 1)
  end
end
