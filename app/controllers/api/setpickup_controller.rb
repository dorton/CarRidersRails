class Api::SetpickupController < ApplicationController


  def index
      @setpickups = Pickup.joins(:student).where(user_id: current_user.id, current_pickup: false).order('last_name, first_name')
      @setpickups = @setpickups.search(params[:q]) if params[:q].present?
  end

  def update
    @current_pickup = Pickup.find params[:id]
    @current_pickup.update current_pickup: true
    if @current_pickup.save
      render status: 201, json: @current_pickup
    else
      render status: 422, json: @current_pickup.errors
    end
  end



  def adjust
    @adjusts = Pickup.where(user_id: current_user.id, current_pickup: true).order('updated_at ASC')
  end

  def adjustpickup
    @current_pickup = Pickup.find params[:id]
    @current_pickup.update :current_pickup => :false
    if @current_pickup.save
      render status: 201, json: @current_pickup
    else
      render status: 422, json: @current_pickup.errors
    end
  end



end
