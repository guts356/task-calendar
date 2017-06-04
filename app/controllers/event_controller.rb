class EventController < ApplicationController

  # <Event id: nil, user_id: nil, title: nil, disp_flg: nil, start: nil, end: nil, allDay: nil,
  def events
    @event = Event.for_fullcalendar.is_disp
    respond_to do |format|
      format.json {
        render json:
        @event.to_json(
          only: [:id, :title, :start, :end, :allDay]
        )
      }
    end
  end

  def create
    event = Event.new
    event.attributes = {
      user_id: current_user.id,
      title: params[:title],
      start: params[:start],
      end: params[:end],
    }
    event.save
    respond_to do |format|
      format.json {
        render json:
        @event.to_json(
          only: [:id, :title, :start, :end]
        )
      }
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.attributes = {
      title: params[:title],
      start: params[:start],
      end: params[:end],
    }
    @event.save
    respond_to do |format|
      format.json {
        render json:
        @event.to_json(
          only: [:id, :title, :start, :end]
        )
      }
    end
  end
end