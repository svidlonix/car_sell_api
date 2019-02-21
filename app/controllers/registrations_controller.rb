
class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    if resource.save
      render json: { "message": "User successfully created" }
    else
      render json: { "message": "Please input valid data" }, status: 422
    end
  end
end
