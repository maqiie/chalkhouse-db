class MatchSeatBookingsController < ApplicationController
    before_action :set_match_seat_booking, only: [:destroy]
  
    def index
      @match_seat_bookings = MatchSeatBooking.all
      render json: @match_seat_bookings
    end
  
    def create
      if MatchSeatBooking.exists?(seat_number: params[:seat_number], match_id: params[:match_id])
        render json: { error: 'Seat already booked for this match' }, status: :unprocessable_entity
      else
        @match_seat_booking = current_user.match_seat_bookings.new(match_seat_booking_params)
  
        if @match_seat_booking.save
          render json: @match_seat_booking, status: :created
        else
          render json: @match_seat_booking.errors, status: :unprocessable_entity
        end
      end
    end
  
    def destroy
      @match_seat_booking.destroy
      render json: { message: 'Booking canceled successfully' }, status: :ok
    end
  
    private
  
    def set_match_seat_booking
      @match_seat_booking = MatchSeatBooking.find(params[:id])
    end
  
    def match_seat_booking_params
      params.require(:match_seat_booking).permit(:seat_number, :match_id, :booking_date)
    end
  end
  