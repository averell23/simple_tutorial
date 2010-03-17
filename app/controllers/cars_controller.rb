class CarsController < ApplicationController
  
  # POST /cars
  def create
    @car = Car.new(params[:car])
    
    if @car.save
      flash[:notice] = "You've got a new car."
    else
      flash[:notice] = "There's a problem with your new car."
    end

    redirect_to user_url(@car.user)
  end

  # DELETE /cars/1
  def destroy
    @car = Car.find(params[:id])
    user = @car.user
    @car.destroy

    redirect_to user_url(user)
  end
  
end
