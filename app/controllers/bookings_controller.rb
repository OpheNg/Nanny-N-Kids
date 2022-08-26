class BookingsController < ApplicationController

    def index
        @bookings = Booking.all
    end

    def show
        @booking = Booking.find(params[:id])
    end

    def new
        @booking = Booking.new
    end

    def create 
        @booking = Booking.new(booking_params)

        if @booking.save
            redirect_to @booking
        else
        end
    end

    private

    def booking_params
        params.require(:booking).permit(:end_date, :start_date, :nanny_id)
    end

end
