class Request < ApplicationRecord
  belongs_to :customer
  belongs_to :user

  def status
    @request = self

    @customer_confirmation = @request.customer_confirmation
    @user_confirmation = @request.user_confirmation

    if @customer_confirmation == true && @user_confirmation == true
        @request.status = "Accepted"
    elsif @customer_confirmation == true && @user_confirmation == false
        @request.status = "Pending"
    else
      @request.status = "Declined"
    end
  end


end
