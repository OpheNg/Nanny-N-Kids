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

        #Condition pour ne pas créer des réservations aujourd'hui ou plus tard et date de fin après date départ
        if @booking.start_date >= Date.today && @booking.start_date <= @booking.end_date
           @booking.save
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

    def diff_date
        @booking = Booking.find(params[:id])
        @booking.end_date - @booking.start_date
    end

    def total_price
        @nanny = Nanny.find(params[:nanny_id])
        daily_price = @nanny.price_per_day
        diff_date * daily_price
    end 


end
