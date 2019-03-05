module ProfileController
  class API < Grape::API
    resource :profile do
      before { authenticated! }

      desc 'Return profile.'
      get do
        current_user.as_json(only: [:email, :first_name, :last_name], methods: [:avatar_decode])
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
        requires :avatar_decode, type: String
      end
      post do
        avatar = params[:avatar_decode].present? ? BSON::Binary.new(params[:avatar_decode], :md5) : current_user.avatar
        current_user.update(
          email: params[:email],
          first_name: params[:first_name],
          last_name: params[:last_name],
          avatar: avatar
        )
      end
    end
  end
end
