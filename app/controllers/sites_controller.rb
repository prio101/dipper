class SitesController < ApplicationController
    before_action :authenticate_user!
    def index
    end

    def show
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def sites_params
     params.require(:sites).permit(:title, :link)   
    end
end
