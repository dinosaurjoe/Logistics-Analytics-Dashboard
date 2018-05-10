# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :find_user
  before_action :authenticate_user!
  # before_action :configure_account_update_params, only: [:update]
  # include Accessible
  # skip_before_action :check_customer, only: :destroy
  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

   def user_params
    params.require(:user).permit(:first_name, :last_name, :biography, :phone_number, :website, :email_show, :profile_picture)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
