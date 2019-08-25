class ProjectsController < ApplicationController
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

    def project_params
     params.require(:projecs).permit(:name, :description, :contact_person_details)   
    end
end
