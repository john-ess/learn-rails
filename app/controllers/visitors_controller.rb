class VisitorsController < ApplicationController
  def new
    Rails.logger.debug
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.valid?
      Rails.logger.debug "DEBUG: Valid email #{@visitor.email}"
      @visitor.subscribe
      flash[:notice] = "Signed up #{@visitor.email}"
      redirect_to root_path
    else
      Rails.logger.debug "DEBUG: Invalid email #{@visitor.email}"
      flash[:alert] = "Invalid email address."
      render :new # new_visitor_path
    end
  end

  private
  def secure_params
    params.require(:visitor).permit(:email)
  end
end
