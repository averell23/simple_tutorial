class CarsController < ApplicationController
  
  # POST /cars
  def create
    @car = Car.new(params[:car])
    
    if @car.save
      flash[:notice] = "You've got a new car."
    else
      flash[:notice] = "There's a problem with your new car."
    end

    update_or_redirect(@car.user)
  end

  # DELETE /cars/1
  def destroy
    @car = Car.find(params[:id])
    user = @car.user
    @car.destroy
    
    update_or_redirect(user)
  end
  
  private
  
  def update_or_redirect(user)
    if(request.xhr?)
      render :partial => 'users/car_list', :object => user.cars
    else
      redirect_to_user user
    end
  end
  
end
