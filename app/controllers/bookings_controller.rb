class BookingsController < ApplicationController

    def index
        @user = User.find(params[:user_id])
        @bookings = Booking.all
    end

    def show
        @booking = Booking.find(params[:id])
    end

    #Ne fonctionne pas
    def new
        @user = User.find(params[:user_id])
        @booking = Booking.new
    end

    #Ne fonctionne pas
    def create 
        @booking = Booking.new(booking_params)

        @user = User.find(params[:user_id])
        @booking.user = @user

        if @booking.save
            redirect_to user_booking_path(@booking.user.id, @booking.id)
        else
        end
    end


    def edit
        @booking = Booking.find(params[:id])
    end

    def update
        @booking = Booking.find(params[:id])

        if @booking.update(booking_params_update)
            redirect_to @booking
        else
        end
    end



    private

    def booking_params
        params.require(:booking).permit(:end_date, :start_date, :nanny_id)
    end

end
