module ProfileController
  class API < Grape::API
    resource :profile do
      before { authenticated! }

      desc 'Return profile.'
      get do
        current_user
      end
    end

    namespace :profile_update do
      before { authenticated! }

      desc 'Update profile.'
      params do
        requires :email, type: String
        requires :first_name, type: String
        requires :last_name, type: String
        requires :password, type: String
        requires :confirm_password, type: String
      end
      post do
        current_user.update(
          email: params[:email],
          first_name: params[:first_name],
          last_name: params[:last_name]
        )
      end
    end
  end
end
