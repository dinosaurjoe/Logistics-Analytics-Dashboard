# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # include Accessible
  # skip_before_action :check_user, only: :destroy

  # GET /resource/sign_in
  def new
    super
      respond_to do |format|
         format.js  #-> app/views/controller/index.js.erb
         format.html
      end
  end

  # POST /resource/sign_in
  def create
    super
      respond_to do |format|
         format.js  #-> app/views/controller/index.js.erb
         format.html
      end
  end

  # DELETE /resource/sign_out
  def destroy
    super
      respond_to do |format|
         format.js  #-> app/views/controller/index.js.erb
         format.html
      end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
