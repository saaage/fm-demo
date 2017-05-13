class ProvidersController < ApplicationController

  def index
  end

  def show
    @provider = Provider.find(params[:id])
  end

  def new
  end

  def create
    @provider = Provider.new(provider_params)

    @provider.save
    redirect_to @provider
  end

  private
    def provider_params
      params.require(:provider).permit(:name, :specialty, :experience, :email)
    end

end
