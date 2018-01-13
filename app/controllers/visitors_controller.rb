class VisitorsController < ApplicationController
  def new
    @owner = Owner.new
    # render 'visitors/new' <- no need to include. this just happens
  end
end
