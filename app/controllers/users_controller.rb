class UsersController < ApplicationController
    before_action :authenticate_user!

    def edit  
    end

    def update
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :company_name)
    end
end
