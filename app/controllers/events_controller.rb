class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @events = Event.all
    respond_with(@events)
  end

  def show
    @farm = Farm.find(params[:farm_id])
  end

  def new
    @farm = Farm.find(params[:farm_id])
    @event = @farm.events.build(start_date: params[:start_date], end_date: params[:start_date])
  end

  def edit
  end

  def create
    @farm = Farm.find(params[:farm_id])
    @event = @farm.events.build(event_params)
    @event.save
    redirect_to edit_farm_path(@farm)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :address, :start_time, :end_time, :start_date, :end_date)
  end
end
