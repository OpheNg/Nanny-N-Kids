class NanniesController < ApplicationController
  def index
    @user = current_user
    @nannies = Nanny.all
    @nannies = policy_scope(Nanny).order(created_at: :desc)

    @markers = @nannies.geocoded.map do |nanny|
      {
        lat: nanny.latitude,
        lng: nanny.longitude,
        info_window: render_to_string(partial: "info_window", locals: { nanny: nanny }),
        image_url: helpers.asset_url("mama.png")
      }
    end
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

  def update
    @nanny = Nanny.find(params[:id])

    @user = current_user
    @nanny.user = @user
    authorize @nanny

    if @nanny.update(nanny_params_update)
      redirect_to nannies_path
    else
    end
  end

  def destroy
    @nanny = Nanny.find(params[:format])
    authorize @nanny

    if @nanny.destroy
      redirect_to nannies_path
    else
    end
  end

  private

  def nanny_params
    params.require(:nanny).permit(:first_name, :last_name, :tel, :price_per_day, :photo, :email, :address, :description)
  end

  def nanny_params_update
    params.require(:nanny).permit(:price_per_day, :address, :description, :email)
  end
end
