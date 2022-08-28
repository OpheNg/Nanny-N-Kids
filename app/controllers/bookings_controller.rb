class BookingsController < ApplicationController

    def index
        @user = current_user
        @bookings = Booking.all
        @bookings = policy_scope(Booking).order(created_at: :desc)
        
    end

    def show
        @user = current_user
        @booking = Booking.find(params[:id])
        authorize @booking
    end

    def new

        @nanny = Nanny.find(params[:nanny_id])
        @user = current_user
        @booking = Booking.new
        authorize @booking
    end

    def create 
        @booking = Booking.new(booking_params)

        @user = current_user
        @booking.user = current_user
        authorize @booking

        if @booking.save
            redirect_to bookings_path
        else
        end
    end


    def edit
        @user = current_user
        @booking = Booking.find(params[:format])
        authorize @booking
    end

    def update
        @booking = Booking.find(params[:id])

        @user = current_user
        @booking.user = @user
        authorize @booking

        if @booking.update(booking_params_update)
            redirect_to booking_path
        else
        end
    end

    def destroy 
        @booking = Booking.find(params[:format])
        authorize @booking
        
        if @booking.destroy
            redirect_to bookings_path
        else
        end
    end 



    private

    def booking_params
        params.require(:booking).permit(:end_date, :start_date, :nanny_id)
    end

    def booking_params_update
        params.require(:booking).permit(:end_date)
    end

end
