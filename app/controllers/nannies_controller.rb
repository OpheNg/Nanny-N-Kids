class NanniesController < ApplicationController


    def index
        @user = current_user
        @nannies = Nanny.all
        @nannies = policy_scope(Nanny).order(created_at: :desc)
    end

    def new
        @user = current_user
        @nanny = Nanny.new
        authorize @nanny
    end

    def create
        @nanny = Nanny.new(nanny_params)

        @user = current_user
        @nanny.user = current_user
        authorize @nanny

        if @nanny.save
            redirect_to nannies_path
        else
        end 
    end 

    def edit
        @user = current_user
        @nanny = Nanny.find(params[:format])
        authorize @nanny
    end

    private 

    def nanny_params
        params.require(:nanny).permit(:first_name, :last_name, :tel, :price_per_day)
    end 


end