module Track
  class API < Grape::API
    version 'v1'
    format :json
    prefix :api

    mount Track::UsersAPI
  end
end