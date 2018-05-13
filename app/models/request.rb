class Request < ApplicationRecord
  belongs_to :customer
  belongs_to :user


  def status
    @request = self

    if @request.user_confirmation && @request.customer_confirmation = true
        @request.status = "Accepted"
    elsif @request.user_confirmation || @request.customer_confirmation = false
        @request.status = "Declined"
    else
        @request.status = "Open"
    end
  end


end
