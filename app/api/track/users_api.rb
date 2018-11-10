module Track
  class UsersAPI < Grape::API
    namespace :users do

     params do
       requires :url, desc: 'url for which short url generated'
       requires :user_email, desc: 'user for which short url generated'
     end
     post :generate_url do
       user = User.find_or_create_by!(email: params[:user_email])
       user.create_referrals_for_product(params[:url])
     end
    end
  end
end