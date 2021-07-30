class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:customer).permit(:first_name, :last_name, :phone_number, :address_line_1, :address_line_2, :city, :province_id, :postal_code, :email, :password)
  end

  def account_update_params
    params.require(:customer).permit(:first_name, :last_name, :phone_number, :address_line_1, :address_line_2, :city, :province_id, :postal_code, :email, :password, :password_confirmation, :current_password)
  end

end